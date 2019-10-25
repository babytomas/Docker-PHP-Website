#!/bin/bash
PHP_VERSION=`php -v | grep -o -m 1 "[0-9].[0-9]" | head -1`

gzip -d ioncube_loaders_lin_x86-64.tar.gz
tar -xf ioncube_loaders_lin_x86-64.tar -C /usr/local/etc/php/

echo -e "[ionCube Loader]\nzend_extension=\"/usr/local/etc/php/ioncube/ioncube_loader_lin_${PHP_VERSION}.so\"" >> /usr/local/etc/php/php.ini
