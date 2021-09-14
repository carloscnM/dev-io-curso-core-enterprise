using Microsoft.Extensions.Options;
using NSE.Core.Comunications;
using NSE.WebApp.MVC.Extensions;
using NSE.WebApp.MVC.Models;
using System.Net.Http;
using System.Threading.Tasks;

namespace NSE.WebApp.MVC.Services
{
    public class AutentificacaoService : Service, IAutentificacaoService
    {
        private readonly HttpClient _httpClient;

        public AutentificacaoService(HttpClient httpClient, IOptions<AppSettings> settings)
        {
            httpClient.BaseAddress = new System.Uri(settings.Value.AutenticacaoUrl);
            _httpClient = httpClient;
        }

        public async Task<UsuarioRespostaLogin> Login(UsuarioLogin usuarioLogin)
        {
            StringContent loginContent = ObterConteudo(usuarioLogin);

            HttpResponseMessage response = await _httpClient.PostAsync("/api/identidade/autenticar", loginContent);


            if (!TratarErrosResponse(response))
            {
                return new UsuarioRespostaLogin
                {
                    RespostaResult = await DeserializarObjetoResponse<ResponseResult>(response)
                };
            }

            return await DeserializarObjetoResponse<UsuarioRespostaLogin>(response);
        }

        public async Task<UsuarioRespostaLogin> Registro(UsuarioRegistro usuarioRegistro)
        {
            StringContent registroContent = ObterConteudo(usuarioRegistro);

            HttpResponseMessage response = await _httpClient.PostAsync("/api/identidade/nova-conta", registroContent);

            if (!TratarErrosResponse(response))
            {
                return new UsuarioRespostaLogin
                {
                    RespostaResult = await DeserializarObjetoResponse<ResponseResult>(response)
                };
            }

            return await DeserializarObjetoResponse<UsuarioRespostaLogin>(response);
        }
    }
}
