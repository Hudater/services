#!/usr/bin/env bash
mkdir -p "${CFG_DIR}"/radarr
mkdir -p "${BAK_CFG_DIR}"/radarr
docker compose up -d --force-recreate

## replace auth method .* means any char of any length, changed delimiter with | due to xml having /
sed -i "s|<AuthenticationMethod>.*</AuthenticationMethod>|<AuthenticationMethod>External</AuthenticationMethod>|g" "${CFG_DIR}"/radarr/config.xml

## Restart container. Getting container name in the `` part
docker restart `docker compose ps --format '{{.Name}}'`
