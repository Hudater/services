#!/bin/bash
mkdir -p "${BAK_CFG_DIR}"/traefik
docker compose -f "${COMPOSE_DIR}/traefik/docker-compose.yml" up -d --force-recreate
