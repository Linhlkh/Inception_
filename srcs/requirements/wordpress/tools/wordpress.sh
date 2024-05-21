#!/bin/bash

sleep 10

wp config create	--allow-root \
					--dbname="khle" \
					--dbuser="superuser" \
					--dbpass="haha" \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --url="khle.42.fr" --title="test" --admin_user="host" --admin_password="haha" --admin_email"=khle.42.fr" --allow-root --path='/var/www/wordpress'

wp user create --allow-root --role=author "user1" "mail1" --user_pass="pass1" --path='/var/www/wordpress' >> log.txt

###
# wp config create	--allow-root \
# 					--dbname=$SQL_DATABASE \
# 					--dbuser=$SQL_USER \
# 					--dbpass=$SQL_PASSWORD \
# 					--dbhost=mariadb:3306 --path='/var/www/wordpress'

# wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'

# wp user create --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> log.txt

if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi

/usr/sbin/php-fpm7.3 -F