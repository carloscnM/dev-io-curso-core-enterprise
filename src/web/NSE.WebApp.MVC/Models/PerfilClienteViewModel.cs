using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace NSE.WebApp.MVC.Models
{
    public class PerfilClienteViewModel
    {
        [Required]
        public string Nome { get; set; }
        public string CPF { get; set; }
        public string Email { get; set; }

        public IList<EnderecoViewModel> Enderecos { get; set; }
    }

    public class DadosBasicosCliente
    {
        public string Nome { get; set; }
        public string Cpf { get; set; }
        public string Email { get; set; }
    }
}
