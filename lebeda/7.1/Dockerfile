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
	locales \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd soap mysqli pdo pdo_mysql zip bcmath intl \
	&& a2enmod rewrite \
	&& usermod -u 1000 www-data \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& curl -o /usr/local/bin/phing https://www.phing.info/get/phing-latest.phar \
	&& chmod +x /usr/local/bin/phing \
	&& chmod u+x /run.sh

RUN sed -i -e 's/# cs_CZ.UTF-8 UTF-8/cs_CZ.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=cs_CZ.UTF-8

RUN apt-get update && \
    apt-get install -y git libssh2-1 libssh2-1-dev && \
    pecl install ssh2-1.0 && \
    echo "extension=ssh2.so" > $PHP_INI_DIR/conf.d/ext-ssh2.ini

ADD 000-default.conf /etc/apache2/sites-enabled/000-default.conf
RUN ln -s /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled

CMD ["/run.sh"]

WORKDIR /var/www/html

