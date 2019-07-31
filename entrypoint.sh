#!/bin/sh

if [ ! -e ".firststart" ]; then
   sleep 15;
   php ./src/install/unattended_install.php;
   touch .firststart;
fi

php-fpm -d upload_max_filesize=10G
