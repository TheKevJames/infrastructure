FROM ubuntu:16.04
MAINTAINER Kevin James <KevinJames@thekev.in>

# Uchiwa v0.11+ can be installed from apt but throws a bunch of weird AngularJS
# issues I don't want to debug.
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get -qy update && \
    apt-get install -qy \
        wget && \
    wget -q https://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | apt-key add - && \
    echo "deb http://sensu.global.ssl.fastly.net/apt sensu main" >> /etc/apt/sources.list.d/sensu.list && \
    apt-get -qy update && \
    apt-get install -qy \
        bc \
        curl \
        g++ \
        make \
        patch \
        sensu \
        supervisor && \
    wget http://dl.bintray.com/palourde/uchiwa/uchiwa_0.10.2-1_amd64.deb && \
    dpkg -i uchiwa_0.10.2-1_amd64.deb && \
    rm uchiwa_0.10.2-1_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

COPY supervisord/exit-listener.py /usr/local/bin/supervisord-exit-listener
COPY supervisord/capture-stdout.diff /tmp/supervisord-capture-stdout.diff
RUN patch /usr/lib/python2.7/dist-packages/supervisor/options.py /tmp/supervisord-capture-stdout.diff

COPY supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN /opt/sensu/embedded/bin/gem install --no-rdoc --no-ri \
        sensu-plugins-cpu-checks \
        sensu-plugins-disk-checks \
        sensu-plugins-http \
        sensu-plugins-memory-checks \
        sensu-plugins-network-checks

COPY config/* /etc/sensu/
COPY checks/* /etc/sensu/conf.d/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
