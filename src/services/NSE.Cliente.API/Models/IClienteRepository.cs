using NSE.Core.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NSE.Clientes.API.Models
{
    public interface IClienteRepository : IRepository<Cliente>
    {
        void Adicionar(Cliente cliente);
        void Atualizar(Cliente cliente);
        Task<IEnumerable<Cliente>> ObterTodos();
        Task<Cliente> ObterPorCpf(string cpf);
        Task<Cliente> ObterPorId(Guid id);
        void AdicionarEndereco(Endereco endereco);
        void AtualizarEndereco(Endereco endereco);

        Task<IList<Endereco>> ObterTodosEnderecosEnderecoPorCliente(Guid clienteId);
        Task<Endereco> ObterEnderecoPorClienteId(Guid clienteId);
        Task<Endereco> ObterEnderecoPorId(Guid enderecoId);
        Task<Endereco> ObterEnderecoPorId(Guid clienteId, Guid enderecoId);
        Task<Guid?> ObterEnderecoPadraoId(Guid clienteId);
    }
}
