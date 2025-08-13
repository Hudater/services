#!/usr/bin/env bash
set -e
CREATE_DIRS=( ./netbootxyz )
mkdir -p "${CREATE_DIRS[@]}"
# export PUID=$(id -u)
# export PGID=$(id -g)
export HOSTNAME=$(hostname)
export PATH+=':/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
curl -LJO "https://github.com/Hudater/services/raw/refs/heads/main/docker/netbootxyz/docker-compose.yml"
docker compose -f "./docker-compose.yml" up -d --force-recreate