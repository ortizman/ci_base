FROM maven:3.8.1-amazoncorretto-11

LABEL maintainer="Manuel Ortiz <ortizman@gmail.com>"

RUN yum install -y curl unzip jq awscli

RUN curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN set -o pipefail && curl -sL https://rpm.nodesource.com/setup_14.x | bash - && yum install -y nodejs && yum clean all

RUN npm install -g newman@5.2.2