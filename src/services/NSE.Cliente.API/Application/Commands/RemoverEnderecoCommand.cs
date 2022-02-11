using FluentValidation;
using NSE.Core.Messages;
using System;

namespace NSE.Clientes.API.Application.Commands
{
    public class RemoverEnderecoCommand : Command
    {
        public Guid Id { get; set; }
        public Guid ClienteId { get; set; }

        public RemoverEnderecoCommand(Guid id, Guid clienteId)
        {
            AggregateId = id;
            Id = id;
            ClienteId = clienteId;
        }

        public override bool EhValido()
        {
            ValidationResult = new RemoverEnderecoValidation().Validate(this);
            return ValidationResult.IsValid;
        }

        public class RemoverEnderecoValidation : AbstractValidator<RemoverEnderecoCommand>
        {
            public RemoverEnderecoValidation()
            {
                RuleFor(prop => prop.Id)
                    .NotEqual(Guid.Empty)
                    .WithMessage("Id do cliente endereço é invalido .");

            }
        }

    }
}
