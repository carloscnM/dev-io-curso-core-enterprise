using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NSE.Core.Messages.Integration;
using NSE.MessageBus;
using NSE.Pedidos.API.Application.DTO;
using NSE.Pedidos.API.Application.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace NSE.Pedidos.API.Services
{
    public class PedidoOrquestradorIntegrationHandler : IHostedService, IDisposable
    {
        private readonly ILogger<PedidoOrquestradorIntegrationHandler> _logger;
        private readonly IServiceProvider _serviceProvider;
        private Timer _timer;

        public PedidoOrquestradorIntegrationHandler(ILogger<PedidoOrquestradorIntegrationHandler> logger, IServiceProvider serviceProvider)
        {
            _logger = logger;
            _serviceProvider = serviceProvider;
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation("Serviço de pedidos iniciado.");

            _timer = new Timer(ProcessarPedidos, null, TimeSpan.Zero, TimeSpan.FromSeconds(15));

            return Task.CompletedTask;
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation("Serviço de pedidos Finalizado.");

            _timer?.Change(Timeout.Infinite, 0);

            return Task.CompletedTask;
        }


        private async void ProcessarPedidos(object state)
        {
            _logger.LogInformation("Processando Pedidos...");

            using (IServiceScope scope = _serviceProvider.CreateScope())
            {
                IPedidoQueries pedidoQueries = scope.ServiceProvider.GetRequiredService<IPedidoQueries>();
                PedidoDTO pedido = await pedidoQueries.ObterPedidosAutorizados();

                if (pedido == null) return;

                IMessageBus bus = scope.ServiceProvider.GetRequiredService<IMessageBus>();

                PedidoAutorizadoIntegrationEvent pedidoAutorizado = new PedidoAutorizadoIntegrationEvent(pedido.ClienteId,
                                                                pedido.Id, 
                                                                pedido.PedidoItems.ToDictionary(p => p.ProdutoId, p => p.Quantidade));

                await bus.PublishAsync(pedidoAutorizado);

                _logger.LogInformation($"Pedido ID: {pedido.Id}, com {pedido.PedidoItems.Sum(p => p.Quantidade)} itens, foi encaminhado para baixa de estoque.");
            }

        }

        public void Dispose()
        {
            _timer?.Dispose();
        }
    }
}
