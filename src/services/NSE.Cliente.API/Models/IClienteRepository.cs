﻿using NSE.Core.Data;
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
        Task<IEnumerable<Cliente>> ObterTodos();

        Task<Cliente> ObterPorCpf(string cpf);
    }
}
