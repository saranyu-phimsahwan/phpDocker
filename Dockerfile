# Base Image PHP 7 with FPM Alpine
FROM php:7.4-fpm-buster

# สั่ง update image และติดตั้ง git zip unzip
RUN apt-get update
RUN apt-get install -y git zip unzip

# ติดตั้ง extension mysqli สำหรับไว้เชื่อมต่อกับฐานข้อมูล mysql/mariadb
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN pecl install redis && docker-php-ext-enable redis
RUN pecl install mongodb && docker-php-ext-enable mongodb
# RUN echo "extension=mongodb.so" >> /usr/local/etc/php/php.ini

WORKDIR /var/www/html

EXPOSE 9000