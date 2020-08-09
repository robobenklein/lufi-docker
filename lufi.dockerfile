FROM phusion/baseimage:bionic-1.0.0

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
RUN install_clean git build-essential libssl-dev libio-socket-ssl-perl liblwp-protocol-https-perl zlib1g-dev libpq-dev

RUN cpan Carton

RUN mkdir -p /etc/lufi
RUN mkdir -p /var/lufi

COPY ./lufi /opt/lufi

WORKDIR /opt/lufi
RUN carton install --deployment --without=test --without=swift-storage --without=sqlite --without=mysql

RUN mkdir -p /etc/service/lufi
COPY runit-lufi.sh /etc/service/lufi/run

CMD ["/sbin/my_init"]

