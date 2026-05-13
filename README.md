# Proyecto Docker para Servir Sitio Web Estático en Synology NAS

Este proyecto configura un contenedor Docker que utiliza Nginx para servir archivos web estáticos desde un directorio en un volumen del Synology NAS.

## Estructura del Proyecto

- `Dockerfile`: Define la imagen Docker basada en Nginx.
- `docker-compose.yml`: Configura el servicio y el montaje del volumen.
- `web/`: Directorio placeholder para archivos web (los archivos reales estarán en el volumen).

## Configuración en Synology NAS

1. Asegúrate de que Docker esté instalado en tu Synology NAS.
2. Copia este proyecto a tu NAS (por ejemplo, en `/volume1/docker/web-server`).
3. El archivo `docker-compose.yml` monta el fichero ZIP del sitio web y la carpeta `biblioteca`:
   - `/volume1/web.zip` en `/tmp/web.zip:ro`
   - `/volume1/biblioteca` en `/usr/share/nginx/html/biblioteca:ro`
4. Configura el usuario y contraseña en el archivo `.env` (variables `WEB_USER` y `WEB_PASSWORD`). Si no se configura la contraseña, no habrá autenticación.
5. Sustituye esos caminos por las rutas reales de tu NAS si son diferentes.
6. Ejecuta `docker-compose up -d` para iniciar el contenedor.

> Nota: `web.zip` debe contener el contenido estático del sitio web. El servidor extraerá el ZIP en `/usr/share/nginx/html` al arrancar.

## Autenticación

El sitio web requiere autenticación básica si se configura la variable `WEB_PASSWORD` en el archivo `.env`. Usa el usuario configurado en `WEB_USER` (por defecto `admin`) con la contraseña configurada.

La carpeta `/biblioteca/` está accesible sin autenticación para facilitar el acceso a los archivos.

## Comandos

- Construir e iniciar: `docker-compose up -d`
- Reconstruir e iniciar: `docker compose up --build --force-recreate`
- Detener: `docker-compose down`
- Ver estado del contenedor: `docker compose ps`
- Ver logs: `docker-compose logs`
- Entrar en la shell del contenedor: `docker compose exec web sh`

El sitio web estará disponible en el puerto 80 del NAS.