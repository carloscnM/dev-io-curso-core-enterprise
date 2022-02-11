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

        [HttpPut("/cliente")]
        public async Task<IActionResult> AlterarCliente(AtualizarClienteCommand command)
        {
            command.Id = _user.ObterUserId();
            return CustomResponse(await _mediator.EnviarComando(command));
        }

        [HttpGet("/cliente")]
        public async Task<IActionResult> ObterDadosCliente()
        {
            var cliente = await _clienteRepository.ObterPorId(_user.ObterUserId());
            return cliente == null ? NotFound() : CustomResponse(new {Nome = cliente.Nome, Email = cliente.Email.Endereco, Cpf = cliente.Cpf.Numero});;
        }

        [HttpGet("cliente/endereco")]
        public async Task<IActionResult> ObterEndereco()
        {
            Endereco endereco;
            _logger.LogInformation($"Obtendo endereço.... {_user.ObterUserId()}");

            var idEnderecoPadrao = await _clienteRepository.ObterEnderecoPadraoId(_user.ObterUserId());


            endereco = idEnderecoPadrao.HasValue ? await _clienteRepository.ObterEnderecoPorId(_user.ObterUserId(), idEnderecoPadrao.Value)
                        : await _clienteRepository.ObterEnderecoPorClienteId(_user.ObterUserId()) ;


            return endereco == null ? NotFound() : CustomResponse(endereco);
        }

        [HttpGet("cliente/all-enderecos")]
        public async Task<IActionResult> ObterEnderecoDisponiveis()
        {
            _logger.LogInformation($"Obtendo endereço.... {_user.ObterUserId()}");
            var enderecos = await _clienteRepository.ObterTodosEnderecosEnderecoPorCliente(_user.ObterUserId());

            return enderecos == null ? NotFound() : CustomResponse(enderecos);
        }

        [HttpPost("cliente/endereco")]
        public async Task<IActionResult> AdicionarEndereco(AdicionarEnderecoCommand endereco)
        {
            endereco.ClienteId = _user.ObterUserId();
            return CustomResponse(await _mediator.EnviarComando(endereco));
        }

        [HttpPut("cliente/endereco")]
        public async Task<IActionResult> AlterarEndereco(AlterarEnderecoCommand endereco)
        {
            endereco.ClienteId = _user.ObterUserId();
            return CustomResponse(await _mediator.EnviarComando(endereco));
        }

        [HttpDelete("cliente/endereco/{id}")]
        public async Task<IActionResult> RemoverEndereco(string id)
        {
            RemoverEnderecoCommand endereco = new RemoverEnderecoCommand(new System.Guid(id), _user.ObterUserId());
            return CustomResponse(await _mediator.EnviarComando(endereco));
        }

        [HttpPut("cliente/endereco/padrao")]
        public async Task<IActionResult> AtualizarEnderecoPadrao(AtualizarEnderecoPadraoCommand endereco)
        {
            endereco.ClienteId = _user.ObterUserId();
            return CustomResponse(await _mediator.EnviarComando(endereco));
        }
    }
}
