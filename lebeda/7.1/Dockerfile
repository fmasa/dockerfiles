FROM php:7.1-apache

MAINTAINER Frantisek Masa <frantisekmasa1@gmail.com>

ADD run.sh /run.sh

RUN apt-get update \
	&& apt-get install -y \ 
	libxml2-dev \
	git \
	zlib1g-dev \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libpng12-dev \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd soap mysqli pdo pdo_mysql zip bcmath \
	&& a2enmod rewrite \
	&& usermod -u 1000 www-data \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& chmod u+x /run.sh

ADD 000-default.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["/run.sh"]

WORKDIR /var/www/html

