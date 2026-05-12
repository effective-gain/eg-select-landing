FROM nginx:alpine

# Copy static site
COPY index.html /usr/share/nginx/html/index.html

# Custom nginx config for SPA-style 404 fallback + gzip
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
