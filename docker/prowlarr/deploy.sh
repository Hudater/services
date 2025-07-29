#!/usr/bin/env bash
mkdir -p "${CFG_DIR}"/prowlarr
mkdir -p "${BAK_CFG_DIR}"/prowlarr
docker compose -f "${COMPOSE_DIR}/prowlarr/docker-compose.yml" up -d --force-recreate
