using System;
using FluentValidation;
using NSE.Core.Messages;

namespace NSE.Clientes.API.Application.Commands
{
    public class AlterarEnderecoCommand : Command
    {
        public Guid Id { get; set; }
        public Guid ClienteId { get; set; }
        public string Logradouro { get; set; }
        public string Numero { get; set; }
        public string Complemento { get; set; }
        public string Bairro { get; set; }
        public string Cep { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }

        public AlterarEnderecoCommand()
        {
        }

        public AlterarEnderecoCommand(Guid id,Guid clienteId, string logradouro, string numero, string complemento,
            string bairro, string cep, string cidade, string estado)
        {
            Id = id;
            AggregateId = clienteId;
            ClienteId = clienteId;
            Logradouro = logradouro;
            Numero = numero;
            Complemento = complemento;
            Bairro = bairro;
            Cep = cep;
            Cidade = cidade;
            Estado = estado;
        }

        public override bool EhValido()
        {
            ValidationResult = new EnderecoValidation().Validate(this);
            return ValidationResult.IsValid;
        }

        public class EnderecoValidation : AbstractValidator<AlterarEnderecoCommand>
        {
            public EnderecoValidation()
            {
                RuleFor(x => x.ClienteId)
                    .NotEmpty()
                    .WithMessage("O Id do endereço é obrigatório para realizar uma alteração");

                RuleFor(c => c.Logradouro)
                    .NotEmpty()
                    .WithMessage("Informe o Logradouro");

                RuleFor(c => c.Numero)
                    .NotEmpty()
                    .WithMessage("Informe o Número");

                RuleFor(c => c.Cep)
                    .NotEmpty()
                    .WithMessage("Informe o CEP");

                RuleFor(c => c.Bairro)
                    .NotEmpty()
                    .WithMessage("Informe o Bairro");

                RuleFor(c => c.Cidade)
                    .NotEmpty()
                    .WithMessage("Informe o Cidade");

                RuleFor(c => c.Estado)
                    .NotEmpty()
                    .WithMessage("Informe o Estado");
            }
        }
    }
}