FROM nginx:alpine

RUN apk add --no-cache unzip

# Copy static web files (fallback) and entrypoint to extract ZIP at runtime
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80

CMD ["docker-entrypoint.sh"]