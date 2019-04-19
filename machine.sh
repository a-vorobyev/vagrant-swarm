docker-machine create -d generic \
    --generic-ip-address 10.10.10.10 \
    --generic-ssh-key  /vagrant/insecure_private_key \
    --generic-ssh-user vagrant \
    horse1


docker-machine create -d generic \
    --generic-ip-address 10.10.10.11 \
    --generic-ssh-key  /vagrant/insecure_private_key \
    --generic-ssh-user vagrant \
    horse2


sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian bionic stable"
