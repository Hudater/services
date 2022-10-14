#!/bin/sh
mkdir -p "${CFG_DIR}"/prowlarr
mkdir -p "${BAK_CFG_DIR}"/prowlarr
docker compose up -d