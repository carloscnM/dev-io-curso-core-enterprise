using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NSE.WebApp.MVC.Models;
using NSE.WebApp.MVC.Services;

namespace NSE.WebApp.MVC.Controllers
{
    public class CatalogoController : MainController
    {
        private readonly ICatalogoService _catalogoService;

        public CatalogoController(ICatalogoService catalogoService)
        {
            _catalogoService = catalogoService;
        }

        [HttpGet]
        [Route("")]
        [Route("vitrine")]
        public async Task<IActionResult> Index([FromQuery] int pageSize = 8, [FromQuery] int page = 1, [FromQuery] string query = null)
        {
            PagedViewModel<ProdutoViewModel> pagedProdutos = await _catalogoService.ObterPaginado(pageSize, page, query);
            ViewBag.Pesquisa = query;
            pagedProdutos.ReferenceAction = "Index";

            return View(pagedProdutos);
        }

        [HttpGet]
        [Route("produto-detalhe/{id}")]
        public async Task<IActionResult> ProdutoDetalhe(Guid id)
        {
            ProdutoViewModel produto = await _catalogoService.ObterPorId(id);
            return View(produto);
        }
    }
}