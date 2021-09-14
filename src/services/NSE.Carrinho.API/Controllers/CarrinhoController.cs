using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NSE.Carrinho.API.Data;
using NSE.Carrinho.API.Model;
using NSE.WebApi.Core.Controllers;
using NSE.WebApi.Core.Usuario;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace NSE.Carrinho.API.Controllers
{
    [Authorize]
    public class CarrinhoController : MainController
    {

        private readonly IAspNetUser _aspNetUser;
        private readonly CarrinhoContext _contexto;

        public CarrinhoController(IAspNetUser aspNetUser,
                                    CarrinhoContext context)
        {
            _aspNetUser = aspNetUser;
            _contexto = context;
        }

        [HttpGet("carrinho")]
        public async Task<CarrinhoCliente> ObterCarrinho()
        {
            return await ObterCarrinhoCliente() ?? new CarrinhoCliente();
        }

        [HttpPost("carrinho")]
        public async Task<IActionResult> AdicionarItemCarrinho(CarrinhoItem item)
        {
            CarrinhoCliente carrinho = await ObterCarrinhoCliente();

            if (carrinho == null)
                ManipularNovoCarrinho(item);
            else
                ManipularCarrinhoExistente(carrinho, item);


            if (!OperacaoValida()) return CustomResponse();

            await PersistirDados();

            return CustomResponse();
        }



        [HttpPut("carrinho/{produtoId}")]
        public async Task<IActionResult> AtualizarItemCarrinho(Guid produtoId, CarrinhoItem item)
        {
            CarrinhoCliente carrinho = await ObterCarrinhoCliente();

            CarrinhoItem itemCarrinho = await ObterItemCarrinhoValidado(produtoId, carrinho, item);

            if (itemCarrinho == null) return CustomResponse();

            carrinho.AtualizarUnidades(itemCarrinho, item.Quantidade);


            ValidarCarrinho(carrinho);
            if (!OperacaoValida()) return CustomResponse();

            _contexto.CarrinhoItens.Update(itemCarrinho);
            _contexto.CarrinhoCliente.Update(carrinho);

            await PersistirDados();

            return CustomResponse();
        }

        [HttpDelete("carrinho/{produtoId}")]
        public async Task<IActionResult> RemoverItemCarrinho(Guid produtoId)
        {
            CarrinhoCliente carrinho = await ObterCarrinhoCliente();

            CarrinhoItem itemCarrinho = await ObterItemCarrinhoValidado(produtoId, carrinho);
            if (itemCarrinho == null) return CustomResponse();

            ValidarCarrinho(carrinho);
            if (!OperacaoValida()) return CustomResponse();

            carrinho.RemoverItem(itemCarrinho);

            _contexto.CarrinhoItens.Remove(itemCarrinho);
            _contexto.CarrinhoCliente.Update(carrinho);

            await PersistirDados();
            return CustomResponse();
        }

        [HttpPost]
        [Route("/carrinho/aplicar-voucher")]
        public async Task<IActionResult> AplicarVoucherCarrinho(Voucher voucher)
        {
            CarrinhoCliente carrinho = await ObterCarrinhoCliente();

            carrinho.AplicarVoucher(voucher);

            _contexto.CarrinhoCliente.Update(carrinho);

            await PersistirDados();
            return CustomResponse();
        }


        #region Métodos privados

        private async Task<CarrinhoCliente> ObterCarrinhoCliente()
        {
            return await _contexto.CarrinhoCliente
                .Include(c => c.Itens)
                .FirstOrDefaultAsync(c => c.ClienteId == _aspNetUser.ObterUserId());
        }


        private void ManipularNovoCarrinho(CarrinhoItem item)
        {
            CarrinhoCliente carrinho = new CarrinhoCliente(_aspNetUser.ObterUserId());

            carrinho.AdicionarItem(item);
            ValidarCarrinho(carrinho);

            _contexto.CarrinhoCliente.Add(carrinho);
        }

        private void ManipularCarrinhoExistente(CarrinhoCliente carrinho, CarrinhoItem item)
        {
            var produtoItemExistente = carrinho.CarrinhoItemExistente(item);

            carrinho.AdicionarItem(item);
            ValidarCarrinho(carrinho);

            if (produtoItemExistente)
            {
                _contexto.CarrinhoItens.Update(carrinho.ObterPorProdutoId(item.ProdutoId));
            }
            else
            {
                _contexto.CarrinhoItens.Add(item);
            }

            _contexto.CarrinhoCliente.Update(carrinho);
        }


        private async Task<CarrinhoItem> ObterItemCarrinhoValidado(Guid produtoId, CarrinhoCliente carrinho, CarrinhoItem item = null)
        {
            if (item != null && produtoId != item.ProdutoId)
            {
                AdicionarErroProcessamento("O item não corresponde ao informado");
                return null;
            }

            if (carrinho == null)
            {
                AdicionarErroProcessamento("Carrinho não encontrado");
                return null;
            }

            var itemCarrinho = await _contexto.CarrinhoItens
                .FirstOrDefaultAsync(i => i.CarrinhoId == carrinho.Id && i.ProdutoId == produtoId);

            if (itemCarrinho == null || !carrinho.CarrinhoItemExistente(itemCarrinho))
            {
                AdicionarErroProcessamento("O item não está no carrinho");
                return null;
            }

            return itemCarrinho;
        }


        private async Task PersistirDados()
        {
            int result = await _contexto.SaveChangesAsync();

            if (result <= 0) AdicionarErroProcessamento("Não foi possível persistir os dados");
        }

        private bool ValidarCarrinho(CarrinhoCliente carrinho)
        {
            if (carrinho.EhValido()) return true;

            carrinho.ValidationResult.Errors.ToList().ForEach(e => AdicionarErroProcessamento(e.ErrorMessage));
            return false;
        }
       
        #endregion
    }
}
