using FluentValidation.Results;
using MediatR;
using System.Threading;
using System.Threading.Tasks;
using NSE.Clientes.API.Application.Events;
using NSE.Clientes.API.Models;
using NSE.Core.Messages;

namespace NSE.Clientes.API.Application.Commands
{
    public class ClienteCommandHandler : CommandHandler,
        IRequestHandler<RegistrarClienteCommand, ValidationResult>,
        IRequestHandler<AdicionarEnderecoCommand, ValidationResult>,
        IRequestHandler<AlterarEnderecoCommand, ValidationResult>,
        IRequestHandler<AtualizarEnderecoPadraoCommand, ValidationResult>
    {
        private readonly IClienteRepository _clienteRepository;

        public ClienteCommandHandler(IClienteRepository clienteRepository)
        {
            _clienteRepository = clienteRepository;
        }

        public async Task<ValidationResult> Handle(RegistrarClienteCommand message, CancellationToken cancellationToken)
        {
            if (!message.EhValido()) return message.ValidationResult;

            Cliente cliente = new Cliente(message.Id, message.Nome, message.Email, message.Cpf);

            Cliente clienteExistente = await _clienteRepository.ObterPorCpf(cliente.Cpf.Numero);

            if (clienteExistente != null)
            {
                AdicionarErro("Este CPF já está em uso.");
                return ValidationResult;
            }

            _clienteRepository.Adicionar(cliente);

            cliente.AdicionarEvento(new ClienteRegistradoEvent(message.Id, message.Nome, message.Email, message.Cpf));

            return await PersistirDados(_clienteRepository.UnitOfWork);
        }

        public async Task<ValidationResult> Handle(AdicionarEnderecoCommand message, CancellationToken cancellationToken)
        {
            if (!message.EhValido()) return message.ValidationResult;

            var endereco = new Endereco(message.Logradouro, message.Numero, message.Complemento, message.Bairro, message.Cep, message.Cidade, message.Estado, message.ClienteId);
            _clienteRepository.AdicionarEndereco(endereco);

            Cliente cliente = await _clienteRepository.ObterPorId(message.ClienteId);

            if (cliente == null) 
            {
                AdicionarErro("Cliente não encontrado, não será possível adicionar o endereço");
                return ValidationResult;
            }

            cliente.AtribuirEnderecoDefault(endereco);

            _clienteRepository.Atualizar(cliente);

            return await PersistirDados(_clienteRepository.UnitOfWork);
        }

        public async Task<ValidationResult> Handle(AtualizarEnderecoPadraoCommand  message, CancellationToken cancellationToken)
        {
            if (!message.EhValido()) return message.ValidationResult;


            var endereco = await _clienteRepository.ObterEnderecoPorId(message.ClienteId,message.Id);

            if (endereco == null)
            {
                AdicionarErro("Endereço não encontrado, não será possível alterar o endereço padrão");
                return ValidationResult;
            }

            var cliente = await _clienteRepository.ObterPorId(message.ClienteId);

            if (cliente == null)
            {
                AdicionarErro("Cliente não encontrado, não será possível alterar o endereço padrão");
                return ValidationResult;
            }


            cliente.AtribuirEnderecoDefault(endereco);

            _clienteRepository.Atualizar(cliente);

            return await PersistirDados(_clienteRepository.UnitOfWork);
        }


        public async Task<ValidationResult> Handle(AlterarEnderecoCommand message, CancellationToken cancellationToken)
        {
            if (!message.EhValido()) return message.ValidationResult;

            var enderecoAtualizado = new Endereco(message.Logradouro, message.Numero, message.Complemento, message.Bairro, message.Cep, message.Cidade, message.Estado, message.ClienteId);

            var endereco = await _clienteRepository.ObterEnderecoPorId(message.Id);

            if (endereco == null)
            {
                AdicionarErro("Endereço não encontrado, não será possível alterar o endereço");
                return ValidationResult;
            }

            endereco.AtualizarEndereco(enderecoAtualizado);

            _clienteRepository.AtualizarEndereco(endereco);

            return await PersistirDados(_clienteRepository.UnitOfWork);
        }


    }
}