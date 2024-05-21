FROM debian:buster

EXPOSE 9000

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y wget

RUN add-apt-repository ppa:ondrej/php

RUN apt-get -y update && apt-get install -y php8.2 php-fpm php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# move ... to make command wp can run from anywhere

COPY    ./conf/www.conf    /etc/php/8.2/fpm/pool.d/www.conf
COPY	./conf/homepage.html /var/www/wordpress/homepage.html
COPY	./tools/wordpress.sh wordpress.sh

ENTRYPOINT [ "bash", "wordpress.sh" ]