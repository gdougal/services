FROM alpine:3.7
RUN apk update
RUN apk upgrade
RUN apk add vim vsftpd openssl

RUN rm /etc/vsftpd/vsftpd.conf
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/certs/vsftpd.key -x509 -days 365 -out /etc/ssl/certs/vsftpd.pem -subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=gdougal/CN=localhost"

RUN adduser -D ftps
RUN echo "ftps:ftps" | chpasswd

RUN mkdir -p /var/run/vsftpd/
RUN touch /var/run/vsftpd/vsftpd.pid

EXPOSE 21000 21

ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf