FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get -y install nodejs

COPY . ./
RUN dotnet restore && \
    dotnet build "dotnet6.csproj" -c Release && \
    dotnet publish "dotnet6.csproj" -c Release -o publish

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS http://*:5000

RUN groupadd -r eshwar && \
    useradd -r -g eshwar -s /bin/false eshwar && \
    chown -R eshwar:eshwar /app

USER eshwar

EXPOSE 9000
ENTRYPOINT ["dotnet", "dotnet6.dll"]