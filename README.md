# Infrastructure

This project is used to configure routing of my various projects.

## Usage

### Terraform

State management for physical infrastructure. About to be heavily modified.

### Docker

This repository defines two docker images: `nginx` and `ssl`. The former is a
reverse-proxy meant to be run in the same swarm as the rest of my projects. The
latter is used to configure and renew ssl certificates across each project.

Initial usage requires a bootstrapping process:

    # grab docker config
    curl https://raw.githubusercontent.com/TheKevJames/infrastructure/master/docker-compose.yml > nginx.yml

    # bootstrap ssl
    echo "include /etc/nginx/fragment/ssl.conf;

    location ~ /.well-known {
        root   /usr/share/nginx/volume;
        allow  all;
    }" > cert.conf
    echo "FROM thekevjames/nginx

    COPY cert.conf /etc/nginx/fragment/cert.conf" > Dockerfile
    docker build -t temp .
    docker service create --name temp --mount type=volume,source=thekevjames_webroot,destination=/usr/share/nginx/volume -p 80:80 -p 443:443 temp
    docker run --rm -v thekevjames_certs:/etc/letsencrypt -v thekevjames_webroot:/webroot -it thekevjames/ssl:latest generate-certs
    docker service rm temp
    docker rmi temp

This bootstrapping will generate the required certificate volumes. After this,
this project can be used normally as follows:

    # run services
    docker stack deploy -c nginx.yml thekevjames

    # update services
    docker service update --force thekevjames_nginx
    docker service update --force thekevjames_ssl

TODO: force nginx update after ssl cert renew.

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
