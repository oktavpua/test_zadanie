FROM php:8.1-fpm


RUN apt update; apt install nano libpq-dev -y \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-install pdo pdo_pgsql pgsql


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR /var/www/
COPY ./app/composer.json ./
RUN composer install

WORKDIR /var/www/html
