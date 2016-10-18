FROM ubuntu:16.04
MAINTAINER Kevin James <KevinJames@thekev.in>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qy && \
    apt-get install -qy --no-install-recommends \
        graphite-carbon \
        graphite-web \
        patch \
        python-pip \
        supervisor && \
    rm -rf /var/lib/apt/lists/*

COPY supervisord/exit-listener.py /usr/local/bin/supervisord-exit-listener
COPY supervisord/capture-stdout.diff /tmp/supervisord-capture-stdout.diff
RUN patch /usr/lib/python2.7/dist-packages/supervisor/options.py /tmp/supervisord-capture-stdout.diff

COPY supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY graphite.py /etc/graphite/local_settings.py
RUN pip install --upgrade pip && \
    pip install django-cors-headers && \
    graphite-manage syncdb --noinput

RUN touch /etc/carbon/storage-aggregation.conf
COPY carbon.conf /etc/carbon/carbon.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
