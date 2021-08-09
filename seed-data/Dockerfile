#Imagen python oficial
FROM python:3.9-slim

# ADICION DE herramineta apache
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apache2-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /seed

COPY . .

# Creacion de archivos POST con formato compatible
RUN python make-data.py

CMD /seed/generate-votes.sh