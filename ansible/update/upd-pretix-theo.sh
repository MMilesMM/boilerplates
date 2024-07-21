#!/bin/bash

cd /root/pretix_plugins

echo "Updating Pretix..."

docker pull pretix/standalone:stable #Downloading new image

docker build . -t mypretix #Building custom Dockerfile

systemctl restart pretix.service #Restarting pretix service to load new Dockerimage

sleep  15
echo "Waiting 15 seconds for the docker container"

docker exec -it pretix.service pretix upgrade #Run Post-Upgrade Skript
