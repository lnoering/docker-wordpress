FROM php:8.0-fpm-alpine

RUN touch /var/log/error_log

ADD ./conf/php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 app && adduser -G app -g app -s /bin/sh -D app

RUN mkdir -p /var/www/html

RUN chown app:app /var/www/html

WORKDIR /var/www/html

RUN apk add --update --no-cache bzip2-dev zlib-dev libpng-dev gettext-dev gmp-dev openssl-dev icu-dev libxml2-dev libxslt-dev libzip-dev

RUN docker-php-ext-install \
    mysqli \
    pdo \
    pdo_mysql \
    bz2 \
    bcmath \
    calendar \
    dba \
    exif \
    gd \
    gettext \
    gmp \
    intl \
    pcntl \
    shmop \
    soap \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    xsl \
    zip \
    opcache

RUN docker-php-ext-enable \
    mysqli \
    pdo \
    pdo_mysql \
    bz2 \
    bcmath \
    calendar \
    dba \
    exif \
    gd \
    gettext \
    gmp \
    intl \
    pcntl \
    shmop \
    soap \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    xsl \
    zip \
    opcache


ADD ./conf/php/custom-php.ini /usr/local/etc/php/conf.d/custom-php.ini

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
