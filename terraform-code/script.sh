#!/bin/bash
for I in {1..7}; do
    echo "Welcome $I"
    sleep 1
done
apt update -y
apt install -y nginx jq net-tools
curl https://get.docker.com | sudo bash
sudo docker version
sudo docker stop app1 || true
sudo docker run --rm -d --name app1 -p 8000:80 sreeharshav/testcontainer:v1
sudo docker ps

