#Imagen microsoft 
FROM microsoft/dotnet:2.1-sdk-nanoserver-sac2016 as builder
#Directorio de trabajo
WORKDIR /Result
COPY Result/Result.csproj .
RUN dotnet restore
#Cipiando archivos a contendor
COPY /Result .
RUN dotnet publish -c Release -o /out Result.csproj

# Imagen de aplicacion
FROM microsoft/dotnet:2.1-aspnetcore-runtime-nanoserver-sac2016

WORKDIR /app
ENTRYPOINT ["dotnet", "Result.dll"]

COPY --from=builder /out .