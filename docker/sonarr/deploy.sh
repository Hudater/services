#!/usr/bin/env bash
mkdir -p "${CFG_DIR}"/sonarr
mkdir -p "${BAK_CFG_DIR}"/sonarr
docker compose up -d