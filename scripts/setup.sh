#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

sudo apt install -y docker.io unzip curl

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o awscliv2.zip
sudo ./aws/install --update
rm -rf awscliv2.zip aws/

if ! getent group docker > /dev/null; then
    sudo groupadd docker
fi
sudo usermod -aG docker $USER

/usr/local/bin/aws s3 cp s3://my-app-nginx-config/default.conf ./nginx/default.conf

sudo /usr/local/bin/docker-compose up --build -d