#!/bin/bash

# obvious
sudo apt install vim

# ssh
sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh
ssh-import-id gh:pinkpolkadots

# fan control, need to change the configuration
sudo apt install mbpfan
sudo service mbpfan start
sudo cp mbpfan.upstart /etc/init/mbpfan.conf
sudo start mbpfan

# docker
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

#Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# GitHub login
gh auth login

# nginx
sudo apt install nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# ubuntu server
sudo apt install ubuntu-server
sudo systemctl set-default multi-user.target
sudo apt purge ubuntu-desktop -y && sudo apt autoremove -y && sudo apt autoclean
sudo reboot

# need to have setup for docker containers
# pihole, syncthing, lute, nginx-proxy, dockge
# can try setting up *arr stack
