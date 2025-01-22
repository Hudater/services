#!/bin/sh
mkdir -p ${BAK_CFG_DIR}/fireflyiii/upload
mkdir -p ${DB_CFG_DIR}/fireflyiii/fireflyiii_mariadb
docker compose up -d
