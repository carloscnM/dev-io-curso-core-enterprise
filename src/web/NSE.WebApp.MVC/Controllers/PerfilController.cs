using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using NSE.WebApp.MVC.Models;
using NSE.WebApp.MVC.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NSE.WebApp.MVC.Controllers
{
    [Authorize]
    public class PerfilController : MainController
    {
        private readonly IClienteService _clienteService;

        public PerfilController(IClienteService clienteService)
        {
            _clienteService = clienteService;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var dadosBasicosCliente = await _clienteService.ObterCliente();
            var enderecosClientes = await _clienteService.ObterTodosEnderecos();

            PerfilClienteViewModel model = new PerfilClienteViewModel() { 
                Nome = dadosBasicosCliente.Nome, 
                CPF = dadosBasicosCliente.Cpf, 
                Email = dadosBasicosCliente.Email, 
                Enderecos = enderecosClientes
            };

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> AlterarDadosCliente(PerfilClienteViewModel model)
        {
            var response = await _clienteService.AtualizarNomeCliente(model.Nome);

            if (ResponsePossuiErros(response)) TempData["Erros"] =
                ModelState.Values.SelectMany(v => v.Errors.Select(e => e.ErrorMessage)).ToList();

            return Redirect("Index");
        }

        [HttpPost]
        public async Task<IActionResult> RemoverEndereco(string Id)
        {
            var response = await _clienteService.RemoverEndereco(Id);

            if (ResponsePossuiErros(response)) TempData["Erros"] =
                ModelState.Values.SelectMany(v => v.Errors.Select(e => e.ErrorMessage)).ToList();

            return Redirect("Index");
        }

        [HttpPost]
        public async Task<IActionResult> NovoEndereco(EnderecoViewModel endereco)
        {
            var response =  await _clienteService.AdicionarEndereco(endereco);

            if (ResponsePossuiErros(response)) TempData["Erros"] =
                ModelState.Values.SelectMany(v => v.Errors.Select(e => e.ErrorMessage)).ToList();

            return Redirect("Index");
        }


        [HttpPost]
        public async Task<IActionResult> AlterarEndereco(EnderecoViewModel endereco)
        {
            var response = await _clienteService.AtualizarEndereco(endereco);

            if (ResponsePossuiErros(response)) TempData["Erros"] =
                ModelState.Values.SelectMany(v => v.Errors.Select(e => e.ErrorMessage)).ToList();

            return Redirect("Index");
        }
    }
}