FROM php:8.0-fpm

RUN apt-get update && apt-get install -y libpng-dev libbz2-dev libzip-dev libxslt-dev default-mysql-client git zip \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-install bcmath bz2 calendar exif gettext mysqli pdo_mysql gd pcntl sockets opcache xsl zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer &&\
    composer self-update --1

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/bin/symfony

ADD ./ /mase
WORKDIR /mase
COPY docker/php/local/www.conf /usr/local/etc/php-fpm.d/www.conf
RUN composer install
RUN chmod -R 0777 /var/
