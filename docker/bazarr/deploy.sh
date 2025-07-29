#!/usr/bin/env bash
mkdir -p "${CFG_DIR}"/bazarr
mkdir -p "${BAK_CFG_DIR}"/bazarr
docker compose up -f "${COMPOSE_DIR}/bazarr/docker-compose.yml" up -d --force-recreate