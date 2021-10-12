using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NetDevPack.Domain;
using NSE.Core.Messages.Integration;
using NSE.MessageBus;
using NSE.Pagamentos.API.Models;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace NSE.Pagamentos.API.Services
{
    public class PagamentoIntegrationHandler : BackgroundService
    {
        private readonly ILogger<PagamentoIntegrationHandler> _logger;
        private readonly IServiceProvider _serviceProvider;
        private readonly IMessageBus _bus;

        public PagamentoIntegrationHandler(IServiceProvider serviceProvider, IMessageBus bus, ILogger<PagamentoIntegrationHandler> logger)
        {
            _serviceProvider = serviceProvider;
            _bus = bus;
            _logger = logger;
        }

        private void SetResponder()
        {
            _bus.RespondAsync<PedidoIniciadoIntegrationEvent, ResponseMessage>(async request => await AutorizarPagamento(request));
        }

        private void SetSubscribers()
        {
            _bus.SubscribeAsync<PedidoCanceladoIntegrationEvent>("PedidoCancelado", async request =>
            await CancelarPagamento(request));

            _bus.SubscribeAsync<PedidoBaixadoEstoqueIntegrationEvent>("PedidoBaixadoEstoque", async request =>
            await CapturarPagamento(request));
        }


        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            SetResponder();
            SetSubscribers();
            return Task.CompletedTask;
        }

        private async Task<ResponseMessage> AutorizarPagamento(PedidoIniciadoIntegrationEvent message)
        {
            _logger.LogInformation($"Iniciando autorização de pagamento do pedido: {message.PedidoId}");
            ResponseMessage response;

            using (IServiceScope scope = _serviceProvider.CreateScope())
            {
                IPagamentoService pagamentoService = scope.ServiceProvider.GetRequiredService<IPagamentoService>();

                Pagamento pagamento = new Pagamento
                {
                    PedidoId = message.PedidoId,
                    TipoPagamento = (TipoPagamento) message.TipoPamento,
                    Valor = message.Valor,
                    CartaoCredito = new CartaoCredito(
                        message.NomeCartao, message.NumeroCartao, message.MesAnoVencimento, message.CVV)
                };


                response = await pagamentoService.AutorizarPagamento(pagamento);
            }

            return response;
        }

        private async Task CancelarPagamento(PedidoCanceladoIntegrationEvent message)
        {
            _logger.LogInformation($"Iniciando cancelamento de pagamento do pedido: {message.PedidoId}");
            using (var scope = _serviceProvider.CreateScope())
            {
                var pagamentoService = scope.ServiceProvider.GetRequiredService<IPagamentoService>();

                var response = await pagamentoService.CancelarPagamento(message.PedidoId);

                if (!response.ValidationResult.IsValid)
                    throw new DomainException($"Falha ao cancelar pagamento do pedido {message.PedidoId}");
            }
        }

        private async Task CapturarPagamento(PedidoBaixadoEstoqueIntegrationEvent message)
        {
            _logger.LogInformation($"Iniciando captura de pagamento do pedido: {message.PedidoId}");
            using (var scope = _serviceProvider.CreateScope())
            {
                IPagamentoService pagamentoService = scope.ServiceProvider.GetRequiredService<IPagamentoService>();

                ResponseMessage response = await pagamentoService.CapturarPagamento(message.PedidoId);

                if (!response.ValidationResult.IsValid)
                    throw new DomainException($"Falha ao capturar pagamento do pedido {message.PedidoId}");

                _logger.LogInformation($"Pagamento capturado, pedido: {message.PedidoId}");
                await _bus.PublishAsync(new PedidoPagoIntegrationEvent(message.ClienteId, message.PedidoId));
            }
        }

    }
}
