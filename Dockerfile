FROM maven:3.8.1-amazoncorretto-11

LABEL maintainer="Manuel Ortiz <ortizman@gmail.com>"

RUN yum install -y unzip wget jq awscli git gcc openssl-devel make

# Instalo la ultima version de cURL
# para usar la feature --fail-with-body, que permite ver el body de error cuando falla
RUN wget https://curl.haxx.se/download/curl-7.76.1.tar.gz  && \
    gunzip -c curl-7.76.1.tar.gz | tar xvf - && \ 
    cd curl-7.76.1 && ./configure --with-openssl && \ 
    make && \ 
    make install && \ 
    curl --version

RUN curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN set -o pipefail && curl -sL https://rpm.nodesource.com/setup_14.x | bash - && yum install -y nodejs && yum clean all

RUN npm install -g newman@5.2.2 && npm cache clean --force