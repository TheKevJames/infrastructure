# install docker
# https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-repository
sudo apt-get update
sudo apt-get install -qy \
     apt-transport-https \
     ca-certificates \
     curl \
     git \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -qy docker-ce

# install docker-compose
sudo apt-get install -qy python-pip
sudo pip install docker-compose

# deploy thekev.in
# deploy devstat
# deploy jarvis (scp jarvis.db)
# deploy league
# deploy youshouldread
# deploy infrastructure
