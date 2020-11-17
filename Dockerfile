FROM alpine:20200917 AS build

# add c build tools
RUN apk add build-base

# add zlib dev
RUN apk add zlib-dev

# add php dev
RUN apk add php7-dev

# add git
RUN apk add git

# clone php-spx
RUN git clone https://github.com/NoiseByNorthwest/php-spx.git

# set workdir
WORKDIR /php-spx

# checkout release
RUN git checkout tags/v0.4.10

# build php-spx
RUN phpize
RUN ./configure
RUN make

# start clean image
FROM 8ct8pus/apache-php-fpm-alpine:latest

# copy spx module from ubuntu image to clean image
COPY --from=build /php-spx/modules/spx.so /usr/lib/php7/modules/spx.so

# add spx to php config
ADD --chown=root:root include/spx.ini /etc/php7/conf.d/spx.ini

# add source files to site
ADD --chown=root:root html/public/index.php /var/www/html/public/index.php
ADD --chown=root:root html/public/phpinfo.php /var/www/html/public/phpinfo.php

# set workdir
WORKDIR /var/www/html/public
