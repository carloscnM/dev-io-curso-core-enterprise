#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["./services/NSE.Cliente.API/NSE.Clientes.API.csproj", "services/NSE.Cliente.API/"]
COPY ["./building_blocks/NSE.Core/NSE.Core.csproj", "building_blocks/NSE.Core/"]
COPY ["./building_blocks/NSE.WebApi.Core/NSE.WebApi.Core.csproj", "building_blocks/NSE.WebApi.Core/"]
COPY ["./building_blocks/NSE.MessageBus/NSE.MessageBus.csproj", "building_blocks/NSE.MessageBus/"]


RUN dotnet restore "services/NSE.Cliente.API/NSE.Clientes.API.csproj"
COPY . .
WORKDIR "services/NSE.Cliente.API"
RUN dotnet build "NSE.Clientes.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "NSE.Clientes.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "NSE.Clientes.API.dll"]