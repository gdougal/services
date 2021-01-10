FROM alpine:latest

### -> INSTALATION UTILS AND UPGRADE ALPINE <- ###
RUN apk update
RUN apk upgrade
RUN apk add php7 php7-fpm lighttpd php7-common php7-iconv \
php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap \
php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype \
php7-dom php7-mbstring php7-opcache php7-zlib php7-session
RUN apk add nginx supervisor vim
### -> INSTALATION UTILS AND UPGRADE ALPINE <- ###


### -> PHPMYADMIN INSTALLATION <- ###
ENV version 5.0.4
ADD https://files.phpmyadmin.net/phpMyAdmin/"$version"/phpMyAdmin-"$version"-english.tar.gz /
RUN tar xfz phpMyAdmin-"$version"-english.tar.gz
RUN rm phpMyAdmin-"$version"-english.tar.gz
#RUN mv phpMyAdmin-"$version" phpMyAdmin
RUN mv phpMyAdmin-"$version"-english /etc/phpMyAdmin
### -> PHPMYADMIN INSTALLATION <- ###


### -> PREPARE DIRECTORIES AND CONFIGS <- ###
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/run/php
RUN touch /var/run/nginx/nginx.pid

RUN rm etc/nginx/conf.d/default.conf
COPY nginx.conf etc/nginx/conf.d/
COPY config.inc.php etc/phpMyAdmin/
COPY supervisord.conf ./etc/supervisord.conf
### -> PREPARE DIRECTORIES AND CONFIGS <- ###

EXPOSE 5000
CMD ["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
