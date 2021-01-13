FROM alpine:latest
RUN mkdir -p temp /run/nginx
RUN apk update
RUN apk upgrade
RUN apk add openssl nginx supervisor openssh sudo

RUN openssl req -newkey rsa:2048 -nodes -keyout \
/temp/cert.key -x509 -days 365 -out /temp/cert.pem \
-subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=gdougal/CN=localhost"

RUN rm etc/nginx/conf.d/default.conf
COPY nginx.conf etc/nginx/conf.d/
COPY supervisord.conf ./etc/
RUN adduser -D admin -G wheel && echo admin:admin | chpasswd && echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
ADD ssh_host_rsa_key ssh_host_ecdsa_key ssh_host_ed25519_key /etc/ssh/
EXPOSE 22 80 443
CMD /usr/bin/supervisord -c ./etc/supervisord.conf


#RUN ssh-keygen -A
#RUN chown -R www var/lib/nginx/html
#RUN sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config ;\
#sed -i "s/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g" /etc/ssh/sshd_config ;\
#sed -i "s/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g" /etc/ssh/sshd_config ;\
#sed -i "s/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g" /etc/ssh/sshd_config
