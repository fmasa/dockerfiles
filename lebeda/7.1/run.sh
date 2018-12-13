#!/bin/bash

IFS=';' read -r -a writable_dirs_array <<< "${WRITABLE_DIRS:-/var/www/html/temp}"

for element in "${writable_dirs_array[@]}"
do
    chown www-data:www-data $element -R
    chmod 777 $element
    echo "$element"
done


# Enable bash history
touch /var/www/.bash_history
chown www-data:www-data /var/www/.bash_history

if [ "$ALLOW_OVERRIDE" = "**False**" ]; then
    unset ALLOW_OVERRIDE
else
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
    a2enmod rewrite
fi

source /etc/apache2/envvars
tail -F /var/log/apache2/* &

service mysql start

if [ "$1" = "background" ]
    then
        service apache2 start
    else
     exec apache2 -D FOREGROUND
fi

