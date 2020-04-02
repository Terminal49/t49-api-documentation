FROM redocly/redoc
COPY nginx.conf /etc/nginx/
COPY assets/images /usr/share/nginx/html/assets/images
COPY reference/terminal49/terminal49.v1.json /usr/share/nginx/html/terminal49.v1.json
