using NSE.Core.DomainObjects;
using System;
using System.Collections.Generic;

namespace NSE.Clientes.API.Models
{
    public class Cliente : Entity, IAggregateRoot
    {
        public string Nome { get; private set; }
        public Email Email { get; private set; }
        public Cpf Cpf { get; private set; }
        public bool Excluido { get; private set; }
        public Guid? EnderecoDefaultId { get; set; }
        public List<Endereco> Enderecos { get; private set; }

        protected Cliente() {}

        public Cliente(Guid id, string nome, string email, string cpf)
        {
            Id = id;
            Nome = nome;
            Email = new Email(email);
            Cpf = new Cpf(cpf);
            Excluido = false;
        }

        public void TrocarEmail(string email)
        {
            Email = new Email(email);
        }

        public void AtualizarNome(string nome)
        {
            Nome = nome;
        }

        public void AtribuirEnderecoDefault(Endereco endereco)
        {
            EnderecoDefaultId = endereco.Id;
        }
    }
}
