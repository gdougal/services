FROM alpine:latest
RUN apk update && upgrade
#RUN apk add openssh
#RUN apk add openssl
RUN apk add bash openrc wget
RUN apk add nginx supervisor php-fpm
RUN mkdir -p temp /run/nginx /var/www/wrot_press
RUN rm etc/nginx/conf.d/default.conf
COPY supervisord.conf ./etc/
COPY nginx.conf etc/nginx/conf.d/
#RUN adduser www ; chown -R www var/lib/nginx/html
#RUN echo "www:q" | chpasswd
EXPOSE 5050
CMD /usr/bin/supervisord -c ./etc/supervisord.conf
