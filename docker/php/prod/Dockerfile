FROM php:8.0 AS builder

RUN apt-get update && apt-get install -y libpng-dev libbz2-dev libzip-dev libxslt-dev default-mysql-client git zip \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-install bcmath bz2 calendar exif gettext mysqli pdo_mysql gd pcntl sockets opcache xsl zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer &&\
    composer self-update --1

ADD ./ /mase
WORKDIR /mase

RUN composer install
FROM php:8.0-fpm AS runner

RUN apt-get update && apt-get install -y libpng-dev libbz2-dev libzip-dev libxslt-dev default-mysql-client git zip \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-install bcmath bz2 calendar exif gettext mysqli pdo_mysql gd pcntl sockets opcache xsl zip

COPY --from=builder /mase /mase
WORKDIR /mase
COPY docker/php/prod/www.conf /usr/local/etc/php-fpm.d/www.conf
RUN chmod -R 0777 /var/
