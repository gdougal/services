FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add bash vim vsftpd openssl
RUN adduser -g ftps
RUN echo "ftps:ftps" | chpasswd
EXPOSE 21 21000
CMD ["vsftpd /etc/vsftpd.conf"]