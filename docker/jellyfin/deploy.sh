#!/usr/bin/env bash
mkdir -p "${CFG_DIR}"/jellyfin
#renderGid="getent group render | cut -d: -f3"
docker compose up -d
