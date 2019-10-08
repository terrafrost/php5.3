FROM php:5.3

RUN apt-get update \
    && apt-get install -y --force-yes libgmp-dev wget \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h \
    && cd /tmp \
    && wget --no-check-certificate https://museum.php.net/php5/php-5.3.29.tar.xz \
    && tar xvf php-5.3.29.tar.xz \
    && cd php-5.3.29/ext/gmp \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && cd ../bcmath \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && printf "extension=gmp.so\nextension=bcmath.so" > /usr/local/lib/php.ini