#!/bin/sh
sudo chmod 644 logrotation.conf
sudo chown root logrotation.conf
mkdir ~/somewheretostorelogs
sudo mv ./logrotation.conf /etc/logrotate.d

sudo mv ./docker-redis.service /etc/systemd/system
sudo systemctl enable docker-redis

sudo docker run --name redis -p 6379:6379 -d redis:3.2-alpine --requirepass $1