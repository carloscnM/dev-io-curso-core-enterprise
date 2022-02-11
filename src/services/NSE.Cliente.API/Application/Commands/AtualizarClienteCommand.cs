using FluentValidation;
using NSE.Core.Messages;
using System;

namespace NSE.Clientes.API.Application.Commands
{
    public class AtualizarClienteCommand : Command
    {
        public Guid Id { get; set; }
        public string Nome { get; set; }

        public AtualizarClienteCommand(Guid id, string nome)
        {
            AggregateId = id;
            Id = id;
            Nome = nome;
        }

        public override bool EhValido()
        {
            ValidationResult = new AtulizarClienteValidation().Validate(this);
            return ValidationResult.IsValid;
        }

        public class AtulizarClienteValidation : AbstractValidator<AtualizarClienteCommand>
        {
            public AtulizarClienteValidation()
            {
                RuleFor(prop => prop.Id)
                    .NotEqual(Guid.Empty)
                    .WithMessage("Id do cliente inválido.");

                RuleFor(prop => prop.Nome)
                    .NotEmpty()
                    .WithMessage("O nome do cliente precisa ser informado.");
            }
        }

    }
}
