FROM php:8.0-fpm-alpine

RUN touch /var/log/error_log

ADD ./conf/php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 app && adduser -G app -g app -s /bin/sh -D app

RUN mkdir -p /var/www/html

RUN chown app:app /var/www/html

WORKDIR /var/www/html

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql