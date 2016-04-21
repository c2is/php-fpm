#!/bin/bash

if [ ! -d "/var/www" ]; then
    mkdir /var/www
fi

mkdir /var/www/.composer
chown -R www-data:www-data /var/www/.composer