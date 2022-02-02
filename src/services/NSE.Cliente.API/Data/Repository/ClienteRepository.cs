using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using NSE.Clientes.API.Models;
using NSE.Core.Data;

namespace NSE.Clientes.API.Data.Repository
{
    public class ClienteRepository : IClienteRepository
    {
        private readonly ClientesContext _context;

        public ClienteRepository(ClientesContext context)
        {
            _context = context;
        }

        public IUnitOfWork UnitOfWork => _context;

        public async Task<IEnumerable<Cliente>> ObterTodos()
        {
            return await _context.Clientes.AsNoTracking().ToListAsync();
        }

        public Task<Cliente> ObterPorCpf(string cpf)
        {
            return _context.Clientes.FirstOrDefaultAsync(c => c.Cpf.Numero == cpf);
        }

        public Task<Cliente> ObterPorId(Guid id)
        {
            return _context.Clientes.FirstOrDefaultAsync(c => c.Id == id);
        }

        public void Adicionar(Cliente cliente)
        {
            _context.Clientes.Add(cliente);
        }

        public void Atualizar(Cliente cliente)
        {
            _context.Clientes.Update(cliente);
        }

        public async Task<IList<Endereco>> ObterTodosEnderecosEnderecoPorCliente(Guid clienteId)
        {
            return await _context.Enderecos.Where(e => e.ClienteId == clienteId).ToListAsync();
        }

        public async Task<Endereco> ObterEnderecoPorClienteId(Guid id)
        {
            return await _context.Enderecos.FirstOrDefaultAsync(e => e.ClienteId.ToString() == id.ToString());
        }

        public async Task<Endereco> ObterEnderecoPorId(Guid clienteId, Guid enderecoId)
        {
            return await _context.Enderecos.FirstOrDefaultAsync(e => e.ClienteId.ToString() == clienteId.ToString() && e.Id == enderecoId);
        }

        public async Task<Guid?> ObterEnderecoPadraoId(Guid clienteId)
        {
            var cliente =  await _context.Clientes.FirstOrDefaultAsync(c => c.Id == clienteId);

            return cliente.EnderecoDefaultId;
        }
        public async Task<Endereco> ObterEnderecoPorId(Guid enderecoId)
        {
            return await _context.Enderecos.FirstOrDefaultAsync(e => e.Id == enderecoId);
        }

        public void AdicionarEndereco(Endereco endereco)
        {
            _context.Enderecos.Add(endereco);
        }
        public void AtualizarEndereco(Endereco endereco)
        {
            _context.Enderecos.Update(endereco);
        }

        public void Dispose()
        {
            _context.Dispose();
        }

    }
}