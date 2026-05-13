FROM nginx:alpine

RUN apk add --no-cache unzip wget apache2-utils

# Copy static web files (fallback) and entrypoint to extract ZIP at runtime
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=15s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null 2>&1 || exit 1

CMD ["docker-entrypoint.sh"]