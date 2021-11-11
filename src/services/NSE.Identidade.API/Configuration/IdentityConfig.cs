using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using NetDevPack.Security.Jwt;
using NetDevPack.Security.Jwt.Store.FileSystem;
using NSE.Identidade.API.Data;
using NSE.Identidade.API.Extensions;

namespace NSE.Identidade.API.Configuration
{
    public static class IdentityConfig
    {
        public static IServiceCollection AddIdentityConfiguration(this IServiceCollection services,
            IConfiguration configuration)
        {
            var appSettingsSection = configuration.GetSection("AppTokenSettings");
            services.Configure<AppTokenSettings>(appSettingsSection);

            string contentRoot = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location);
            string tempKeyDirectory = $"{contentRoot}\\temp-keys\\";
            if (!System.IO.Directory.Exists(tempKeyDirectory)) System.IO.Directory.CreateDirectory(tempKeyDirectory);


            services.AddJwksManager(options => options.Jws = JwsAlgorithm.ES256)
            .PersistKeysToFileSystem(new System.IO.DirectoryInfo(tempKeyDirectory));
            //.PersistKeysToDatabaseStore<ApplicationDbContext>();

            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));

            services.AddDefaultIdentity<IdentityUser>()
                    .AddRoles<IdentityRole>()
                    .AddEntityFrameworkStores<ApplicationDbContext>()
                    .AddDefaultTokenProviders();

            //Caso a api precise conhece o usuário autetifacado.
            //services.AddJwtConfiguration(configuration);

            return services;
        }

    }
}
