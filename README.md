# Php-fpm container

### Override configuration

You can override the configuration for the symfony pool by adding a symfony.ini file

```
# Dockerfile
FROM c2is/php-fpm

ADD symfony.ini /etc/php5/fpm/conf.d/
ADD symfony.ini /etc/php5/cli/conf.d/
```

The same can be do for the symfony pool configuration file

```
# Dockerfile
...
ADD conf/symfony.pool.conf /etc/php5/fpm/pool.d/
```

If you want add your own pool be careful to remove the symfony pool because is actually listen the 9000 port