#!/bin/bash

sudo apt update && sudo apt install -y awscli docker.io docker-compose

sudo usermod -aG docker $USER

mkdir -p nginx app

aws s3 cp s3://my-app-nginx-config/default.conf ./nginx/default.conf

sudo docker-compose up --build -d