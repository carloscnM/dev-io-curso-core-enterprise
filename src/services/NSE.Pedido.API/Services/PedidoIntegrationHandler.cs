using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NSE.Core.DomainObjects;
using NSE.Core.Messages.Integration;
using NSE.MessageBus;
using NSE.Pedidos.Domain.Pedido;

namespace NSE.Pedidos.API.Services
{
    public class PedidoIntegrationHandler : BackgroundService
    {
        private readonly ILogger<PedidoIntegrationHandler> _logger;
        private readonly IMessageBus _bus;
        private readonly IServiceProvider _serviceProvider;

        public PedidoIntegrationHandler(IServiceProvider serviceProvider, IMessageBus bus, ILogger<PedidoIntegrationHandler> logger)
        {
            _serviceProvider = serviceProvider;
            _bus = bus;
            _logger = logger;
        }
        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            SetSubscribers();
            return Task.CompletedTask;
        }

        private void SetSubscribers()
        {
            _bus.SubscribeAsync<PedidoCanceladoIntegrationEvent>("PedidoCancelado",
                async request => await CancelarPedido(request));

            _bus.SubscribeAsync<PedidoPagoIntegrationEvent>("PedidoPago",
               async request => await FinalizarPedido(request));
        }

        private async Task CancelarPedido(PedidoCanceladoIntegrationEvent message)
        {
            _logger.LogInformation($"Inciando cancelamento do pedido, pedido: {message.PedidoId}");
            using (var scope = _serviceProvider.CreateScope())
            {
                IPedidoRepository pedidoRepository = scope.ServiceProvider.GetRequiredService<IPedidoRepository>();

                Pedido pedido = await pedidoRepository.ObterPorId(message.PedidoId);
                pedido.CancelarPedido();

                pedidoRepository.Atualizar(pedido);

                if (!await pedidoRepository.UnitOfWork.Commit())
                {
                    throw new DomainException($"Problemas ao cancelar o pedido {message.PedidoId}");
                }
                _logger.LogInformation($"Pedido cancelado, pedido: {message.PedidoId}");
            }
        }

        private async Task FinalizarPedido(PedidoPagoIntegrationEvent message)
        {
            _logger.LogInformation($"Iniciando finalização do pedido, pedido: {message.PedidoId}");
            using (var scope = _serviceProvider.CreateScope())
            {
                IPedidoRepository pedidoRepository = scope.ServiceProvider.GetRequiredService<IPedidoRepository>();

                Pedido pedido = await pedidoRepository.ObterPorId(message.PedidoId);
                pedido.FinalizarPedido();

                pedidoRepository.Atualizar(pedido);

                if (!await pedidoRepository.UnitOfWork.Commit())
                {
                    throw new DomainException($"Problemas ao finalizar o pedido {message.PedidoId}");
                }

                _logger.LogInformation($"Pedido finalizado, pedido: {message.PedidoId}");
            }
        }
    }
}