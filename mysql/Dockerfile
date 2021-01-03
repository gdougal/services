FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN apk add bash
RUN apk add mysql mysql-client
RUN chown -R mysql /etc/mysql/
RUN mkdir temp
COPY DB.sh /temp/
RUN chmod +x /temp/DB.sh
COPY my.cnf etc/mysql/
VOLUME [ "/var/lib/mysql" ]
EXPOSE 3306
CMD ./temp/DB.sh