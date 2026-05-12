# Proyecto Docker para Servir Sitio Web Estático en Synology NAS

Este proyecto configura un contenedor Docker que utiliza Nginx para servir archivos web estáticos desde un directorio en un volumen del Synology NAS.

## Estructura del Proyecto

- `Dockerfile`: Define la imagen Docker basada en Nginx.
- `docker-compose.yml`: Configura el servicio y el montaje del volumen.
- `web/`: Directorio placeholder para archivos web (los archivos reales estarán en el volumen).

## Configuración en Synology NAS

1. Asegúrate de que Docker esté instalado en tu Synology NAS.
2. Copia este proyecto a tu NAS (por ejemplo, en `/volume1/docker/web-server`).
3. El archivo `docker-compose.yml` monta las carpetas del NAS directamente:
   - `/volume1/web` en `/usr/share/nginx/html`
   - `/volume1/biblioteca` en `/usr/share/nginx/html/biblioteca:ro`
4. Sustituye esos caminos por las rutas reales de tu NAS si son diferentes.
5. Ejecuta `docker-compose up -d` para iniciar el contenedor.

> Nota: `web/` y `biblioteca/` deben ser las carpetas reales del NAS, no directorios locales dentro del proyecto.

## Comandos

- Construir e iniciar: `docker-compose up -d`
- Detener: `docker-compose down`
- Ver logs: `docker-compose logs`

El sitio web estará disponible en el puerto 80 del NAS.