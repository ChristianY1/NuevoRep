#Imagen node oficial
FROM node:8.9-slim
#Precofigaracion
RUN apt-get update -qq && apt-get install -qy \ 
    ca-certificates \
    bzip2 \
    curl \
    libfontconfig \
    --no-install-recommends
RUN yarn global add phantomjs-prebuilt
#Agregar archivos a directorio del contenedor 
ADD . /app
WORKDIR /app
CMD ["/app/tests.sh"]
