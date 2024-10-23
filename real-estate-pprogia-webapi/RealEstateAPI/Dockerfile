FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["RealEstateAPI.csproj", "./"]
RUN dotnet restore "./RealEstateAPI.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "RealEstateAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "RealEstateAPI.csproj" -c Release -o /app/publish

FROM base AS final

RUN apt-get update && apt-get install -y curl

WORKDIR /app
COPY --from=publish /app/publish .

ENV ASPNETCORE_ENVIRONMENT="Development"
ENV ASPNETCORE_URLS="http://+:80"
EXPOSE 80

ENTRYPOINT ["dotnet", "RealEstateAPI.dll"]
