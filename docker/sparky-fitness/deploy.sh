#!/usr/bin/env bash
set -e
CREATE_DIRS=( "$DB_CFG_DIR"/sparky-fitness-postgresql "$BAK_CFG_DIR"/sparky-fitness/backup )
mkdir -p "${CREATE_DIRS[@]}"
# ls -alh "$BAK_CFG_DIR"/sparky-fitness/ "$DB_CFG_DIR"
#ls -alh "${CREATE_DIRS[@]}"
docker compose  --env-file "$BAK_CFG_DIR/sparky-fitness/.env" -f "${COMPOSE_DIR}/sparky-fitness/docker-compose.yml" up -d --force-recreate


### Credit: https://askubuntu.com/a/957278
### MAKE SURE TO USE BASH not DASH
## Define array of all dirs to be created like:
# array_dirs=( "${PATH_ENV}/parent_dir/{dir1,dir2{dir2_1, dir2_2}}" "${SECOND_PATH_ENV}"/dir /path )

