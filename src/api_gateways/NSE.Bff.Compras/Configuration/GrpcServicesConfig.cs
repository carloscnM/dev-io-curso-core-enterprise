using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using NSE.Bff.Compras.Services.gRPC;
using NSE.Carrinho.API.Services.gRPC;
using NSE.WebAPI.Core.Extensions;

namespace NSE.Bff.Compras.Configuration
{
    public static class GrpcServicesConfig
    {
        public static void ConfigureGrpcServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSingleton<GrpcServiceInterceptor>();
            services.AddScoped<ICarrinhoGrpcService, CarrinhoGrpcService>();

            services.AddGrpcClient<CarrinhoCompras.CarrinhoComprasClient>(options =>
                {
                    options.Address = new System.Uri(configuration["CarrinhoUrl"]);
                }
            ).AddInterceptor<GrpcServiceInterceptor>()
            .AllowSelfSignedCertificate();
        }
    }
}
