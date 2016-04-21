#!/bin/bash

if [ ! -d "/var/www" ]; then
    mkdir /var/www
fi

mkdir /var/www/.composer
mkdir /var/www/.ssh
chown -R www-data:www-data /var/www/.composer /var/www/.ssh