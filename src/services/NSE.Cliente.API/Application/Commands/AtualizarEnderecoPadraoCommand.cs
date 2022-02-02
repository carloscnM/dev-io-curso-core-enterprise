using System;
using FluentValidation;
using NSE.Core.Messages;

namespace NSE.Clientes.API.Application.Commands
{
    public class AtualizarEnderecoPadraoCommand : Command
    {
        public Guid Id { get; set; }
        public Guid ClienteId { get; set; }


        public AtualizarEnderecoPadraoCommand()
        {
        }

        public AtualizarEnderecoPadraoCommand(Guid id,Guid clienteId)
        {
            Id = id;
            AggregateId = clienteId;
            ClienteId = clienteId;
        }

        public override bool EhValido()
        {
            ValidationResult = new EnderecoValidation().Validate(this);
            return ValidationResult.IsValid;
        }

        public class EnderecoValidation : AbstractValidator<AtualizarEnderecoPadraoCommand>
        {
            public EnderecoValidation()
            {
                RuleFor(x => x.ClienteId)
                    .NotEmpty()
                    .WithMessage("O Id do cliente é obrigatório para realizar uma alteração");
            }
        }
    }
}