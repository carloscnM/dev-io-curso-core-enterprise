using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using NSE.Clientes.API.Application.Commands;
using NSE.Clientes.API.Models;
using NSE.Core.Mediator;
using NSE.WebApi.Core.Controllers;
using NSE.WebApi.Core.Usuario;
using System.Threading.Tasks;

namespace NSE.Clientes.API.Controllers
{
    public class ClientesController : MainController
    {
        private readonly IClienteRepository _clienteRepository;
        private readonly IMediatorHandler _mediator;
        private readonly IAspNetUser _user;
        private readonly ILogger<ClientesController> _logger;

        public ClientesController(IClienteRepository clienteRepository, IMediatorHandler mediator, IAspNetUser user, ILogger<ClientesController> logger)
        {
            _clienteRepository = clienteRepository;
            _mediator = mediator;
            _user = user;
            _logger = logger;
        }

        [HttpGet("cliente/endereco")]
        public async Task<IActionResult> ObterEndereco()
        {
            _logger.LogInformation($"Obtendo endereço.... {_user.ObterUserId()}");
            var endereco = await _clienteRepository.ObterEnderecoPorId(_user.ObterUserId());

            return endereco == null ? NotFound() : CustomResponse(endereco);
        }

        [HttpPost("cliente/endereco")]
        public async Task<IActionResult> AdicionarEndereco(AdicionarEnderecoCommand endereco)
        {
            endereco.ClienteId = _user.ObterUserId();
            return CustomResponse(await _mediator.EnviarComando(endereco));
        }
    }
}
