FROM consul:v0.6.4
MAINTAINER Kevin James <KevinJames@thekev.in>

RUN apk add --update \
        curl && \
    rm -rf /var/cache/apk/* && \
    curl -fsSL https://get.docker.com/builds/Linux/x86_64/docker-1.12.1.tgz > /docker-1.12.1.tgz && \
    tar -xvzf /docker-1.12.1.tgz && \
    mv /docker/* /bin/ && \
    rm -r docker-1.12.1.tgz /docker

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

COPY config/* /consul/config/
