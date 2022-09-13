DOCKER_VERSION=docker-19.03.9
DOCKER_DATA_PATH=/data/docker

mkdir -p $DOCKER_DATA_PATH

mkdir -p /opt/soft
cd /opt/soft
wget https://mirrors.cloud.tencent.com/docker-ce/linux/static/stable/x86_64/${DOCKER_VERSION}.tgz

tar -xvf ./${DOCKER_VERSION}.tgz
mv ./docker/* /usr/local/bin/
chmod +x /usr/local/bin/*
mkdir -p /etc/docker

cat > /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": [
    "https://wa4l0lwb.mirror.aliyuncs.com"
  ],
  "insecure-registries": [
    
  ],
  "max-concurrent-downloads": 10,
  "log-driver": "json-file",
  "log-level": "warn",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  },
  "data-root": "${DOCKER_DATA_PATH}"
}
EOF

cat > /usr/lib/systemd/system/docker.service <<EOF
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target firewalld.service
Wants=network-online.target

[Service]
Type=notify
ExecStart=/usr/local/bin/dockerd
ExecReload=/bin/kill -s HUP 
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
#TasksMax=infinity
TimeoutStartSec=0
Delegate=yes
KillMode=process
Restart=onfailure
StartLimitBurst=3
StartLimitInterval=60s

[Install]
WantedBy=multi-user.target
EOF

rm -Rf ./docker
rm -Rf ./${DOCKER_VERSION}.tgz

systemctl enable --now docker

docker ps

wget https://github.91chi.fun/https://github.com//docker/compose/releases/download/v2.10.2/docker-compose-linux-x86_64
mv ./docker-compose-linux-x86_64 /usr/local/bin/docker-compose
chmod -Rf 777 /usr/local/bin/docker-compose 