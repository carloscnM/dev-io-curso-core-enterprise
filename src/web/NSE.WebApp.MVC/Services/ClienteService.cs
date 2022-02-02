using Microsoft.Extensions.Options;
using NSE.Core.Comunications;
using NSE.WebApp.MVC.Extensions;
using NSE.WebApp.MVC.Models;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace NSE.WebApp.MVC.Services
{
    public interface IClienteService
    {
        Task<EnderecoViewModel> ObterEndereco();
        Task<IList<EnderecoViewModel>> ObterTodosEnderecos();
        Task<ResponseResult> AdicionarEndereco(EnderecoViewModel endereco);
        Task<ResponseResult> AtualizarEndereco(EnderecoViewModel endereco);

        Task<ResponseResult> AlterarEnderecoPadrao(Guid idNovoEnderecoPadrao);
    }

    public class ClienteService : Service, IClienteService
    {
        private readonly HttpClient _httpClient;

        public ClienteService(HttpClient httpClient, IOptions<AppSettings> settings)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri(settings.Value.ClienteUrl);
        }

        public async Task<EnderecoViewModel> ObterEndereco()
        {
            var response = await _httpClient.GetAsync("/cliente/endereco/");

            if (response.StatusCode == HttpStatusCode.NotFound) return null;

            TratarErrosResponse(response);

            return await DeserializarObjetoResponse<EnderecoViewModel>(response);
        }

        public async Task<IList<EnderecoViewModel>> ObterTodosEnderecos()
        {
            var response = await _httpClient.GetAsync("/cliente/all-enderecos");

            if (response.StatusCode == HttpStatusCode.NotFound) return null;

            TratarErrosResponse(response);

            return await DeserializarObjetoResponse<IList<EnderecoViewModel>>(response);
        }

        public async Task<ResponseResult> AdicionarEndereco(EnderecoViewModel endereco)
        {
            var enderecoContent = ObterConteudo(endereco);

            var response = await _httpClient.PostAsync("/cliente/endereco/", enderecoContent);

            if (!TratarErrosResponse(response)) return await DeserializarObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }

        public async Task<ResponseResult> AtualizarEndereco(EnderecoViewModel endereco)
        {
            var enderecoContent = ObterConteudo(endereco);

            var response = await _httpClient.PutAsync("/cliente/endereco/", enderecoContent);

            if (!TratarErrosResponse(response)) return await DeserializarObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }

        public async Task<ResponseResult> AlterarEnderecoPadrao(Guid idNovoEnderecoPadrao)
        {
            var enderecoContent = ObterConteudo(new { Id = idNovoEnderecoPadrao });

            var response = await _httpClient.PutAsync("/cliente/endereco/padrao", enderecoContent);

            if (!TratarErrosResponse(response)) return await DeserializarObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }
    }
}