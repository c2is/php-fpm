#!/bin/bash

# Trigger only on Dockerfile
if [ "$1" = "php-fpm7.0" ]; then
    # Configure git
    if [ -z "$GIT_USERNAME" ] || [ -z "$GIT_EMAIL" ]; then
        echo >&2 "[Git] You don't have specified the required env variables. "
        echo >&2 "Check if you have configure GIT_USERNAME and GIT_EMAIL"
        exit 1;
    fi

    git config --global user.name "$GIT_USERNAME"
    git config --global user.email "$GIT_EMAIL"
fi

exec "$@"