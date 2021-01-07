FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add php php-fpm php-opcache \
php-gd php-mysqli php-zlib php-curl \
php-mbstring php-json php-session
COPY nginx.conf etc/nginx/conf.d/
RUN mkdir -p temp /run/nginx

RUN apk add bash wget nginx supervisor vim
RUN wget https://wordpress.org/wordpress-5.4.tar.gz
RUN tar xfz wordpress-5.4.tar.gz && mv wordpress /var/www/ && chmod -R 777 /var/www/wordpress
RUN chmod -R 777 /var/lib/nginx
RUN adduser www ; chown -R www /var/www/wordpress; chown -R www /var/lib/nginx
#RUN adduser -D -g 'www-data' www-data

COPY wp-config.php /var/www/wordpress/
RUN rm etc/nginx/conf.d/default.conf

COPY supervisord.conf ./etc/

EXPOSE 5050 4000
RUN rm wordpress-5.4.tar.gz
CMD /usr/bin/supervisord -c ./etc/supervisord.conf



