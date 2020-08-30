#!/bin/bash

# Get php version
PHP_VERSION=`php -v | grep -o -m 1 "[0-9].[0-9]" | head -1`

# Unpack ioncube
gzip -d ioncube_loaders_lin_x86-64.tar.gz
tar -xf ioncube_loaders_lin_x86-64.tar -C /usr/local/etc/php/

# Set the ioncube extension
# echo -e "[ionCube Loader]\nzend_extension=\"/usr/local/etc/php/ioncube/ioncube_loader_lin_${PHP_VERSION}.so\"" >> /usr/local/etc/php/php.ini
cat <<EOF >> /usr/local/etc/php/php.ini
[ionCube Loader]
zend_extension="/usr/local/etc/php/ioncube/ioncube_loader_lin_$PHP_VERSION.so"
EOF
