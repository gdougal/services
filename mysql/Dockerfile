FROM alpine:latest
ENV ENV="/etc/profile"
RUN apk add --no-cache exim-scripts
RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN apk add bash vim
RUN apk add mysql mysql-client
RUN mkdir temp
RUN mkdir -p /var/lib/mysql
COPY DB.sh /temp/
COPY my.cnf /etc/mysql/
#RUN chown -R mysql /etc/mysql/
RUN chmod 777 /temp/DB.sh
RUN chmod 777 /var/lib/mysql
VOLUME ["/var/lib/mysql"]
VOLUME ["/sys/fs/cgroup"]
EXPOSE 3306
CMD ["sh", "/temp/DB.sh" ]