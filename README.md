# Infrastructure

This project is used to configure routing of my various projects.

## Usage

    docker-compose build
    docker-compose up -d

### Deploy

Since you only really need the `docker-compose.yml` file for deployment, you
can deploy with:

    curl https://raw.githubusercontent.com/TheKevJames/infrastructure/master/docker-compose.yml > docker-compose.yml
    mkdir -p nginx  # docker-compose oddity
    docker-compose pull
    docker-compose up -d

### SSL

SSL verification uses [Let's Encrypt](https://letsencrypt.org/). To enable SSL
on a new machine, start the NGINX proxy and run:

    sudo letsencrypt certonly -a webroot --webroot-path=./webroot \
        -d devstat.thekev.in -d api.devstat.thekev.in \
        -d thekev.in -d www.thekev.in \
        -d jarvis.thekev.in \
        -d netdata.thekev.in -d status.thekev.in \
        -d youshouldread.thekev.in -d ysr.thekev.in

You should also modify your crontab, to enable auto-renewal:

```crontab
30 2 * * 1 sudo /usr/bin/letsencrypt renew >> /var/log/le-renew.log
35 2 * * 1 cd /path/to/infrastructure && /usr/local/bin/docker-compose up -d
```

## Notes

This project relies on my personal projects having specific port bindings by
default. This ensures any combination of services can run on a single machine
without needing to reconfigure. Currently, the mapping is as follows:

| Port  | Service             |
| ----- | ------------------- |
| 80    | nginx               |
| 19999 | netdata             |
| 28001 | devstat             |
| 28002 | devstat (api)       |
| 28003 | youshouldread       |
| 28004 | youshouldread (api) |
| 28005 | thekev.in           |
| 28006 | league              |
| 28007 | jarvis              |
