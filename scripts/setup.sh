#!/bin/bash


# --- 1. System update & Package installation ---
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y docker.io unzip curl


# --- 2. Install Docker Compose ---
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# --- 3. Install AWS CLI v2 ---
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o awscliv2.zip
sudo ./aws/install --update
rm -rf awscliv2.zip aws/


# --- 4. Configure Docker Permissions ---
if ! getent group docker > /dev/null; then
    sudo groupadd docker
fi
sudo usermod -aG docker $USER


# --- 5. Clean & Prepare Directories ---
mkdir -p nginx app
rm -f ./nginx/default.conf 


# --- 6. Fetch Cloud Configuration from S3 ---
/usr/local/bin/aws s3 cp s3://flask-app-s3/default.conf ./nginx/default.conf


# --- 7. Deploy & Run Containers ---
sudo /usr/local/bin/docker-compose down 
sudo /usr/local/bin/docker-compose up --build -d
