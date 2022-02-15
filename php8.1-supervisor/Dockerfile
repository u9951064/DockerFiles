FROM phpswoole/swoole:4.8-php8.1
MAINTAINER Josh Tsai <u9951064@gmail.com>

RUN mkdir /root/project
WORKDIR /root/project

ENV RUNLEVEL=1;

RUN set -ex \
    && apt-get update \
    && apt-get install -y cron libbz2-dev libzip-dev zip libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxml2-dev libxslt1-dev libmemcached-dev opencc \
    && pecl update-channels \
    && pecl install redis-stable memcached \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install bz2 mysqli pdo pdo_mysql zip simplexml xsl pcntl \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable redis memcached

RUN apt-get clean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

