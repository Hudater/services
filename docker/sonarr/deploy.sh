#!/usr/bin/env bash
mkdir -p "${CFG_DIR}"/sonarr
mkdir -p "${BAK_CFG_DIR}"/sonarr
docker compose up -d

## replace auth method .* means any char of any length, changed delimiter with | due to xml having /
sed -i "s|<AuthenticationMethod>.*</AuthenticationMethod>|<AuthenticationMethod>External</AuthenticationMethod>|g" "${CFG_DIR}"/sonarr/config.xml

## Restart container. Getting container name in the `` part
docker restart `docker compose ps --format '{{.Name}}'`
