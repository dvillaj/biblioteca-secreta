# Proyecto Docker para Servir Sitio Web Estático en Synology NAS

Este proyecto configura un contenedor Docker que utiliza Nginx para servir archivos web estáticos desde un directorio en un volumen del Synology NAS.

## Estructura del Proyecto

- `Dockerfile`: Define la imagen Docker basada en Nginx.
- `docker-compose.yml`: Configura el servicio y el montaje del volumen.
- `.env`: Archivo de variables de entorno para configurar la ruta del directorio web.
- `web/`: Directorio placeholder para archivos web (los archivos reales estarán en el volumen).

## Configuración en Synology NAS

1. Asegúrate de que Docker esté instalado en tu Synology NAS.
2. Copia este proyecto a tu NAS (por ejemplo, en `/volume1/docker/web-server`).
3. Edita el archivo `.env` para establecer `WEB_DIR` a la ruta del directorio que contiene tus archivos web en el NAS (por defecto `/volume1/web`).
4. Coloca tus archivos web en el directorio especificado en `WEB_DIR`.
5. Ejecuta `docker-compose up -d` para iniciar el contenedor.

## Comandos

- Construir e iniciar: `docker-compose up -d`
- Detener: `docker-compose down`
- Ver logs: `docker-compose logs`

El sitio web estará disponible en el puerto 80 del NAS.