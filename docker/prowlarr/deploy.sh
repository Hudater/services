#!/usr/bin/env bash
mkdir -p "${CFG_DIR}"/prowlarr
mkdir -p "${BAK_CFG_DIR}"/prowlarr
docker compose -f "${COMPOSE_DIR}/prowlarr/docker-compose.yml" up -d --force-recreate

## replace auth method .* means any char of any length, changed delimiter with | due to xml having /
sed -i "s|<AuthenticationMethod>.*</AuthenticationMethod>|<AuthenticationMethod>External</AuthenticationMethod>|g" "${CFG_DIR}"/prowlarr/config.xml

## Restart container. Getting container name in the `` part
docker restart `docker compose ps --format '{{.Name}}'`
