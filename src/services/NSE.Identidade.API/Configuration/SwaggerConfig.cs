﻿using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;

namespace NSE.Identidade.API.Configuration
{
    public static class SwaggerConfig
    {
        public static IServiceCollection AddSwaggerConfiguration(this IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "NerdShopEnterprise - Identidade Api",
                    Description = "Essa api faz parte do treinamento Enterprise em Desenvolvedor.IO",
                    Contact = new OpenApiContact() { Name = "Carlos", Email = "carlos@email.com" },
                    License = new OpenApiLicense() { Name = "MIT", Url = new System.Uri("https://opensource.org/licenses/MIT") }
                });
            });

            return services;
        }


        public static IApplicationBuilder UseSwaggerConfiguration(this IApplicationBuilder app)
        {
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "v1");
            }
            );

            return app;
        }
    }
}
