FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    libpq-dev \
    # Install git
    git \
    # Install nginx
    nginx \
    # Install php
    php-cli \
    php-json \
    php-curl \
    php-fpm \
    php-gd \
    php-ldap \
    php-mbstring \
    php-mysql \
    php-pgsql \
    php-soap \
    php-sqlite3 \
    php-xml \
    php-zip \
    php-intl \
    php-imagick \
    # Install tools
    openssl \
    nano \
    graphicsmagick \
    imagemagick \
    ghostscript \
    mysql-client \
    iputils-ping \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Update virtual host
COPY conf/default /etc/nginx/sites-available/default

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 80

WORKDIR /var/www

CMD  ["nginx", "-g", "daemon off;"]