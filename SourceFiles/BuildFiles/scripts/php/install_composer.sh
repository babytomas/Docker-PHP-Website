#!/bin/sh

# Move composer
mv /home/init-scripts/php/composer.phar /usr/bin/composer
chmod +x /usr/bin/composer

# Change the composer mirror
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
