FROM mcr.microsoft.com/dotnet/sdk:7.0 as build 
WORKDIR /src
COPY dockub.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:7.0 
WORKDIR /App
EXPOSE 443
EXPOSE 80
COPY --from=build /app .
ENTRYPOINT ["dotnet", "dockub.dll"]

# Shorter (production) version with "dotnet publish -c Release -o published" command
# FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
# WORKDIR /app
# COPY published/ ./
# ENTRYPOINT ["dotnet", "docker-asp.dll"]