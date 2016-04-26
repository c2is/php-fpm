FROM debian:jessie

RUN apt-get update && apt-get install -y php5-common php5-cli php5-fpm php5-mcrypt php5-mysql php5-apcu php5-gd php5-imagick php5-curl php5-intl php5-pgsql
RUN apt-get install -y php5-memcache php5-memcached

RUN rm /etc/php5/fpm/pool.d/*

ADD conf/symfony.ini /etc/php5/fpm/conf.d/
ADD conf/symfony.ini /etc/php5/cli/conf.d/

ADD conf/symfony.pool.conf /etc/php5/fpm/pool.d/
ADD entrypoint.sh /opt/docker/entrypoint.sh

RUN usermod -u 1000 www-data

# Install composer
RUN apt-get update && apt-get install -y curl
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN mkdir /var/composer
RUN composer require symfony/var-dumper --working-dir=/var/composer
RUN chown -R www-data:www-data /var/composer
RUN echo "auto_prepend_file = /var/composer/vendor/autoload.php" >> /etc/php5/fpm/php.ini
RUN echo "auto_prepend_file = /var/composer/vendor/autoload.php" >> /etc/php5/cli/php.ini

ENV GIT_USERNAME 'c2is'
ENV GIT_EMAIL 'g.manen@c2is.fr'

# Install git
RUN apt-get update && apt-get install -y git
RUN git config --global user.name $GIT_USERNAME
RUN git config --global user.email $GIT_EMAIL

RUN chmod +x /opt/docker/entrypoint.sh && sh /opt/docker/entrypoint.sh

VOLUME /var/www/.ssh

CMD ["php5-fpm", "-F"]

EXPOSE 9000