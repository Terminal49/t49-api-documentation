FROM redocly/redoc
COPY nginx.conf /etc/nginx/
COPY assets/images /usr/share/nginx/html/assets/images
