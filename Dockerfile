FROM php:8.0-fpm

RUN apt-get update && apt-get install -y libpng-dev libzip-dev default-mysql-client git zip \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-install pdo_mysql gd pcntl zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer &&\
    composer self-update --1

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/bin/symfony

ADD ./ /mase
WORKDIR /mase
RUN composer install
RUN chmod -R 0777 /var/

