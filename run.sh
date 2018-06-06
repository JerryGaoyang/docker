#!/bin/bash

docker_file="/usr/bin/docker"
if [ ! -x "$docker_file" ]; then
wget -qO- https://get.docker.com/ | sh
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://g11aydc4.mirror.aliyuncs.com"]
}
EOF
systemctl daemon-reload
systemctl restart docker
fi

docker_compose_file="/usr/local/bin/docker-compose"
if [ ! -x "$docker_compose_file" ]; then
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
fi

docker-compose up -d