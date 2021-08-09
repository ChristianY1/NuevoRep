#Imagen  microsoft 
FROM microsoft/dotnet:2.1-sdk-nanoserver-sac2016 as builder
#Directorio de trabajo
WORKDIR /Worker
COPY Worker/Worker.csproj .
RUN dotnet restore
#Copiado de archivos en diretorio de contenedor
COPY /Worker .
RUN dotnet publish -c Release -o /out Worker.csproj

#Imagen de aplicacion 
FROM microsoft/dotnet:2.1-runtime-nanoserver-sac2016

WORKDIR /app
ENTRYPOINT ["dotnet", "Worker.dll"]
#Construccion
COPY --from=builder /out .