FROM php:7.4.3-apache

LABEL maintainer="frantisekmasa1@gmail.com"

WORKDIR /var/www/html

# Set www-data UID to first non-root UID
# This should make file permissions inside container working out of the box
# for most of developers.
RUN usermod -u 1000 www-data

# Install PHP extensions and other dependencies
RUN apt-get update \
	&& apt-get install -y \
	    git \
	    zlib1g-dev \
	    libfreetype6-dev \
	    libjpeg62-turbo-dev \
	    libmcrypt-dev \
	    libpng-dev \
	    libxml2-dev \
	    libzip-dev \
	    locales \
	&& docker-php-ext-configure gd \
	&& docker-php-ext-install -j$(nproc) gd soap mysqli pdo pdo_mysql zip bcmath \
	&& pecl install xdebug \
	&& rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Phing
RUN curl -o /usr/local/bin/phing https://www.phing.info/get/phing-latest.phar && chmod +x /usr/local/bin/phing

# Generate Czech locale
RUN sed -i -e 's/# cs_CZ.UTF-8 UTF-8/cs_CZ.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=cs_CZ.UTF-8

# Configure Apache
ADD 000-default.conf /etc/apache2/sites-enabled/000-default.conf
RUN ln -s /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled \
    && a2enmod rewrite

# Add startup script
ADD run.sh /run.sh
RUN chmod u+x /run.sh

CMD ["/run.sh"]

