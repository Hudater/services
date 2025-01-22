#!/bin/sh
mkdir -p ${CFG_DIR}/tubearchivist/cache
mkdir -p ${DB_CFG_DIR}/redis_tube
#mkdir -p ${DB_CFG_DIR}/es_tube
docker compose up -d
