FROM phusion/baseimage:bionic-1.0.0

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
RUN install_clean git build-essential libssl-dev libio-socket-ssl-perl liblwp-protocol-https-perl zlib1g-dev libpq-dev

RUN cpan Carton

RUN mkdir -p /etc/lufi
RUN mkdir -p /var/lufi

WORKDIR /opt/
RUN git clone https://framagit.org/fiat-tux/hat-softwares/lufi.git lufi
WORKDIR /opt/lufi

RUN carton install --deployment --without=test --without=swift-storage --without=sqlite

COPY 

CMD ["/sbin/my_init"]

