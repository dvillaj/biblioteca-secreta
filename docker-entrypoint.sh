#!/bin/sh
set -e

# If a ZIP file is mounted at /tmp/web.zip, extract its contents before starting nginx.
if [ -f "/tmp/web.zip" ]; then
  TMP_EXTRACT=/tmp/web-unzip

  # Clean any previous temporary extraction directory.
  rm -rf "$TMP_EXTRACT"
  mkdir -p "$TMP_EXTRACT"

  # Extract the ZIP archive into the temporary folder.
  unzip -o /tmp/web.zip -d "$TMP_EXTRACT"

  echo "Extracted web content from /tmp/web.zip to $TMP_EXTRACT"
  
  # If the ZIP contains a single top-level directory, flatten it.
  # This handles archives where files are inside a nested subfolder.
  top_level_count=$(find "$TMP_EXTRACT" -mindepth 1 -maxdepth 1 | wc -l)
  if [ "$top_level_count" -eq 1 ]; then
    first_item=$(find "$TMP_EXTRACT" -mindepth 1 -maxdepth 1 | head -n 1)
    if [ -d "$first_item" ]; then
      for item in "$first_item"/* "$first_item"/.[!.]* "$first_item"/..?*; do
        if [ -e "$item" ] || [ -L "$item" ]; then
          mv "$item" "$TMP_EXTRACT" 2>/dev/null || true
        fi
      done
      rmdir "$first_item"
    fi
  fi

  # Remove existing website files but keep the mounted biblioteca folder.
  echo "Removing existing website files..."
  find /usr/share/nginx/html -mindepth 1 -maxdepth 1 ! -name biblioteca -exec rm -rf {} +

  # Copy the extracted web content into the nginx document root.
  echo "Copying extracted web content..."
  cp -a "$TMP_EXTRACT"/. /usr/share/nginx/html/

  # Cleanup temporary extraction files.
  rm -rf "$TMP_EXTRACT"
fi

# Generate password file if WEB_PASSWORD is set
if [ -n "$WEB_PASSWORD" ]; then
  echo "Generating password file for basic authentication..."
  WEB_USER=${WEB_USER:-admin}
  htpasswd -bc /etc/nginx/.htpasswd "$WEB_USER" "$WEB_PASSWORD"
else
  echo "No WEB_PASSWORD set, authentication disabled."
  # Remove auth directives by creating a config without auth
  sed -i '/auth_basic/d' /etc/nginx/nginx.conf
fi

# Start nginx in the foreground.
exec nginx -g 'daemon off;'
