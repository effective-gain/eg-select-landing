FROM nginx:alpine

# Copy static site
COPY index.html /usr/share/nginx/html/index.html

# Custom nginx config for SPA-style 404 fallback + gzip
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
