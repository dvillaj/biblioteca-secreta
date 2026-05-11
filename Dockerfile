FROM nginx:alpine

# Copy static web files (optional, if not using volume)
COPY web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]