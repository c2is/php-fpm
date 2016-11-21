FROM c2is/php-fpm:symfony-composer

ADD ffmpeg.tar.gz /usr/local/
ADD libc.conf     /etc/ld.so.conf.d/
