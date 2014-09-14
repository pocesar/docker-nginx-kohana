#!/bin/bash

if [[ "$NGINX_SSL_CERT" != "NULL" && "$NGINX_SSL_KEY" != "NULL" ]]
then
    if [[ -e "$NGINX_SSL_CERT" && -e "$NGINX_SSL_KEY" ]]
    then
        sed -i -e "s@#ssl_certificate;@ssl_certificate $NGINX_SSL_CERT;@" /etc/nginx/sites-available/default;
        sed -i -e "s@#ssl_certificate_key;@ssl_certificate_key $NGINX_SSL_KEY;@" /etc/nginx/sites-available/default;

        echo "=> Set up certificates";
    fi
fi

service php5-fpm restart && service nginx restart