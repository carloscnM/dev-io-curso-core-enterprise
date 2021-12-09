#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["./services/NSE.Pedido.API/NSE.Pedidos.API.csproj", "services/NSE.Pedido.API/"]
COPY ["./services/NSE.Pedidos.Infra/NSE.Pedidos.Infra.csproj", "services/NSE.Pedidos.Infra/"]
COPY ["./services/NSE.Pedidos.Domain/NSE.Pedidos.Domain.csproj", "services/NSE.Pedidos.Domain/"]
COPY ["./building_blocks/NSE.Core/NSE.Core.csproj", "building_blocks/NSE.Core/"]
COPY ["./building_blocks/NSE.WebApi.Core/NSE.WebApi.Core.csproj", "building_blocks/NSE.WebApi.Core/"]
COPY ["./building_blocks/NSE.MessageBus/NSE.MessageBus.csproj", "building_blocks/NSE.MessageBus/"]


RUN dotnet restore "services/NSE.Pedido.API/NSE.Pedidos.API.csproj"
COPY . .
WORKDIR "services/NSE.Pedido.API"
RUN dotnet build "NSE.Pedidos.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "NSE.Pedidos.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "NSE.Pedidos.API.dll"]