FROM consul:v0.6.4
MAINTAINER Kevin James <KevinJames@thekev.in>

RUN apk add --update \
        curl \
        git && \
    rm -rf /var/cache/apk/* && \
    curl -fsSL https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz > /docker-latest.tgz && \
    tar -xvzf docker-latest.tgz && \
    mv /docker/* /bin/ && \
    rm -rf /docker-latest.tgz /docker

COPY . /consul/config/
