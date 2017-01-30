# set secrets in ~/.load_env.sh
echo ". /home/ubuntu/load_env.sh" >> ~/.bashrc

mkdir ~/infrastructure && cd ~/infrastructure
curl https://raw.githubusercontent.com/TheKevJames/infrastructure/master/docker-compose.yml > docker-compose.yml
mkdir -p nginx
docker-compose pull

mkdir ~/league && cd ~/league
curl https://raw.githubusercontent.com/TheKevJames/league/master/docker-compose.yml > docker-compose.yml
docker-compose pull
docker-compose up -d

mkdir ~/thekev.in && cd ~/thekev.in
curl https://raw.githubusercontent.com/TheKevJames/thekev.in/master/docker-compose.yml > docker-compose.yml
mkdir -p web
docker-compose pull
docker-compose up -d

cd ~ && git clone https://github.com/thekevjames/devstat.git && cd devstat
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

cd ~ && git clone https://github.com/thekevjames/jarvis.git && cd jarvis
# copy db
docker-compose pull
docker-compose up -d

curl -Ss 'https://raw.githubusercontent.com/firehol/netdata-demo-site/master/install-required-packages.sh' >/tmp/kickstart.sh && bash /tmp/kickstart.sh -i netdata-all
cd ~ && git clone https://github.com/firehol/netdata.git --depth=1 && cd netdata
sudo ./netdata-installer.sh

docker-compose run nginx sh
echo "include /etc/nginx/fragment/ssl.conf;

location ~ /.well-known {
    root   /usr/share/nginx/volume;
    allow  all;
}" > /etc/nginx/fragment/cert.conf
nginx -g "daemon off;"

cd ~/infrastructure
sudo letsencrypt certonly -a webroot --webroot-path=./webroot \
    -d thekev.in -d www.thekev.in \
    -d devstat.thekev.in -d api.devstat.thekev.in \
    -d jarvis.thekev.in \
    -d league.thekev.in \
    -d netdata.thekev.in -d status.thekev.in \
    -d youshouldread.thekev.in -d ysr.thekev.in
docker-compose down && docker-compose up -d
