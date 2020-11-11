FROM 8ct8pus/apache-php-fpm-alpine:latest

# add c build tools
RUN apk add build-base

# add zlib dev
RUN apk add zlib-dev

# add php dev
RUN apk add php7-dev

# add git
RUN apk add git

# clone php-spx
WORKDIR /
RUN git clone https://github.com/NoiseByNorthwest/php-spx.git

# set workdir
WORKDIR /php-spx

# checkout release
RUN git checkout tags/v0.4.10

# build php-spx
RUN phpize
RUN ./configure
RUN make
RUN make install

# add spx to php config
ADD --chown=root:root include/spx.ini /etc/php7/conf.d/spx.ini

# add source files to site
ADD --chown=root:root src/public/index.php /var/www/html/public/index.php
ADD --chown=root:root src/public/phpinfo.php /var/www/html/public/phpinfo.php

# set workdir
WORKDIR /var/www/html/public
