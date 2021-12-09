using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NetDevPack.Domain;
using NSE.Catalogo.API.Models;
using NSE.Core.Messages.Integration;
using NSE.MessageBus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace NSE.Catalogo.API.Services
{
    public class CatalogoIntegrationHandler : BackgroundService
    {
        private readonly ILogger<CatalogoIntegrationHandler> _logger;
        private readonly IMessageBus _bus;
        private readonly IServiceProvider _serviceProvider;

        public CatalogoIntegrationHandler(IMessageBus bus, IServiceProvider serviceProvider, ILogger<CatalogoIntegrationHandler> logger)
        {
            _bus = bus;
            _serviceProvider = serviceProvider;
            _logger = logger;
        }

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            SetSubsCribers();
            return Task.CompletedTask;
        }

        private void SetSubsCribers()
        {
            _logger.LogInformation($"Conectando na fila...");
            _bus.SubscribeAsync<PedidoAutorizadoIntegrationEvent>("PedidoAutorizado", async request =>
                await BaixarEstoque(request));
            _logger.LogInformation($"Fim...");
        }

        private async Task BaixarEstoque(PedidoAutorizadoIntegrationEvent message)
        {
            _logger.LogInformation($"Iniciando baixa de estoque do pedido: {message.PedidoId}");
            using (var scope = _serviceProvider.CreateScope())
            {
                List<Produto> ProdutosComEstoque = new List<Produto>();
                IProdutoRepository produtoRepository = scope.ServiceProvider.GetRequiredService<IProdutoRepository>();
                string idsProdutos = string.Join(",", message.Itens.Select(c => c.Key));
                List<Produto> produtos = await produtoRepository.ObterProdutosPorId(idsProdutos);


                if (produtos.Count != message.Itens.Count)
                {
                    CancelarPedidoSemEstoque(message);
                    return;
                }

                foreach (Produto produto in produtos)
                {
                    int quantidadeProduto = message.Itens.FirstOrDefault(p => p.Key == produto.Id).Value;
                    if (produto.EstaDisponivel(quantidadeProduto))
                    {
                        produto.RetirarEstoque(quantidadeProduto);
                        ProdutosComEstoque.Add(produto);
                    }

                }

                if(ProdutosComEstoque.Count != message.Itens.Count)
                {
                    CancelarPedidoSemEstoque(message);
                    return;
                }

                foreach (Produto produto in ProdutosComEstoque)
                {
                    produtoRepository.Atualizar(produto);
                }

                if(!await produtoRepository.UnitOfWork.Commit())
                {
                    throw new DomainException($"Problemas ao atualizar o estoque do pedido {message.PedidoId}");
                }

                _logger.LogInformation($"Estoque sensibilizado com sucesso, pedido: {message.PedidoId}");
                PedidoBaixadoEstoqueIntegrationEvent pedidosBaixado = new PedidoBaixadoEstoqueIntegrationEvent(message.ClienteId, message.PedidoId);
                await _bus.PublishAsync(pedidosBaixado);
            }
        }

        public async void CancelarPedidoSemEstoque(PedidoAutorizadoIntegrationEvent message)
        {
            _logger.LogInformation($"Cancelando pedido sem estoque, pedido: {message.PedidoId}");
            PedidoCanceladoIntegrationEvent pedidoCancelado = new PedidoCanceladoIntegrationEvent(message.ClienteId, message.PedidoId);

            await _bus.PublishAsync(pedidoCancelado);
        }
    }
}
