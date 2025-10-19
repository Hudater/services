#!/bin/bash
mkdir -p "${BAK_CFG_DIR}"/traefik
mkdir -p "${DB_CFG_DIR}"/traefik_redis
docker compose -f "${COMPOSE_DIR}/traefik/docker-compose.yml" up -d --force-recreate
