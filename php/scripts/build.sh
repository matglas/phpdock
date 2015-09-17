#!/usr/bin/env bash

cd /var/www

echo "# Krafwagen setup"
drush kw-s --debug
echo "#"

echo "# Krafwagen build"
drush kw-b --debug
echo "#"

chown www-data:www-data -R /var/www/build/

ln -s /var/www/build /var/www/html