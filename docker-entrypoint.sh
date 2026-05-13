#!/bin/sh
set -e

if [ -f "/tmp/web.zip" ]; then
  find /usr/share/nginx/html -mindepth 1 -maxdepth 1 ! -name biblioteca -exec rm -rf {} +
  unzip -o /tmp/web.zip -d /usr/share/nginx/html
fi

exec nginx -g 'daemon off;'
