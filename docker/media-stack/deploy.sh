#!/usr/bin/env bash
set -e
CREATE_DIRS=( "${BAK_CFG_DIR}"/{jellyfin,bazarr,radarr,sonarr,prowlarr,gluetun} "${CFG_DIR}"/{jellyfin,jellyseerr,bazarr,radarr,sonarr,prowlarr,qbittorrent,unmanic} )
mkdir -p "${CREATE_DIRS[@]}"
# ls -alh "${CREATE_DIRS[@]}"
docker compose -f "${COMPOSE_DIR}/media-stack/docker-compose.yml" up -d --force-recreate


### Credit: https://askubuntu.com/a/957278
### MAKE SURE TO USE BASH not DASH
## Define array of all dirs to be created like:
# array_dirs=( "${PATH_ENV}/parent_dir/{dir1,dir2{dir2_1, dir2_2}}" "${SECOND_PATH_ENV}"/dir /path )

