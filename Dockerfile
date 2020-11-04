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

# add source files
ADD --chown=root:root include/index.php /var/www/site/public/index.php
ADD --chown=root:root include/phpinfo.php /var/www/site/public/phpinfo.php

WORKDIR /var/www/site/public
