FROM debian:buster

EXPOSE 443

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl && apt-get install -y openssl
#create a place to store key and certificate TLS

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=khle.42.fr/UID=khle"
# -req: create sefl-signed certificate
# -x509: std format for SSL/TSL cert
# -nodes: (no DES-Data Encryption Standard) not require password to use key
# -out: place to save the cert
# -keyout: place to sav key
# -subj: add infor for cert:
#	+ /C=FR: Cuntry
#	+ /ST=IDF: State
# 	+ /L=Paris: Locality
# 	+ /O=42: Organization
# 	+ /OU=42: Organizational Unit
# 	+ /CN=khle.42.fr : Common Name (domain name)
# 	+ /UID=khle: User ID

RUN mkdir -p /var/run/nginx
# create file to save .conf of Nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress && chmod 755 /var/www/wordpress
# /var/www/wordpress: root to find files index(using in file conf nginx)

RUN chown -R www-data:www-data /var/www/wordpress
# change owner recursive(all child file/folder) 
# www-data:www-dat: user and group using by nginx
# -->nginx can access to this path

CMD [ "nginx", "-g", "daemon off;" ]
# keep nginx run in foreground mode, keep container working for other task