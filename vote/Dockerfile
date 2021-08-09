# Descargamos la imagen oficial de python
FROM python:3.9-slim

# Verificacion de curl
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Decalramos un directorio para el container
WORKDIR /app

# Instalacion de requisitos descritros en requirements
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Copiamos las configuraciones en la carpeta interna del contenedor
COPY . .

# Exponemos los puertos de escucha 
EXPOSE 80

# Definimos los comados que seran ejecutados
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:80", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0"]
