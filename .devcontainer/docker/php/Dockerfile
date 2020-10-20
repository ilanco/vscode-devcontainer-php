ARG PHP_VERSION=7
FROM php:${PHP_VERSION}-fpm

ARG DEBIAN_FRONTEND=noninteractive

# Use the default development configuration
RUN ln -s "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN apt-get update && apt-get install -y \
    unzip wget

# install PDO
RUN apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql

# install bcmath
RUN docker-php-ext-install -j$(nproc) bcmath

# install gd
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# install mysqli
RUN docker-php-ext-install mysqli

ARG XDEBUG_REMOTE_ENABLE=1
ARG XDEBUG_REMOTE_AUTOSTART=1
ARG XDEBUG_REMOTE_CONNECT_BACK=1
ARG XDEBUG_REMOTE_HOST=localhost
ARG XDEBUG_REMOTE_PORT=9001
ARG XDEBUG_REMOTE_LOG

# Install xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_enable=${XDEBUG_REMOTE_ENABLE}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=${XDEBUG_REMOTE_AUTOSTART}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=${XDEBUG_REMOTE_CONNECT_BACK}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host=${XDEBUG_REMOTE_HOST}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=${XDEBUG_REMOTE_PORT}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_log=${XDEBUG_REMOTE_LOG}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.profiler_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.profiler_output_dir=/tmp/snapshots" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.max_nesting_level=9999" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.profiler_enable_trigger=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
