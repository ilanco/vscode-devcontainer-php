FROM nginx:1.19

RUN apt-get update && apt-get -y install openssl \
    && mkdir -p /var/www/public \
    && openssl req -newkey rsa:2048 -x509 -nodes -set_serial 1 -days 3650 \
       -subj "/C=US/ST=NY/L=" \
       -keyout "/etc/ssl/private/server.key" -out "/etc/ssl/private/server.crt" \
    && chmod 400 /etc/ssl/private/server.*
