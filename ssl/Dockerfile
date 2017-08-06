FROM alpine:3.3

RUN apk add --no-cache -U letsencrypt && \
    rm -rf /var/cache/apk/*

COPY generate-certs /bin/generate-certs
COPY renew.crontab /etc/crontabs/root

CMD ["/usr/sbin/crond", "-f", "-d", "0"]
