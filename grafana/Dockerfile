FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add vim bash wget

ENV version_glibc 2.32

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/"$version_glibc"-r0/glibc-"$version_glibc"-r0.apk
RUN apk add glibc-"$version_glibc"-r0.apk

ENV version_grafana 7.3.6

ADD https://dl.grafana.com/oss/release/grafana-"$version_grafana".linux-amd64.tar.gz /


RUN tar -zxvf grafana-"$version_grafana".linux-amd64.tar.gz && mv grafana-7.3.6 /etc/grafana
RUN rm -rf grafana-"$version_grafana".linux-amd64.tar.gz
WORKDIR /etc/grafana/bin/
CMD ["./grafana-server"]