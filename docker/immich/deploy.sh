#!/bin/sh
mkdir -p ${CFG_DIR}/immich
mkdir -p ${CFG_DIR}/immich/immich_model-cache
mkdir -p ${CFG_DIR}/immich/immich_typesense
mkdir -p ${DB_CFG_DIR}/immich_postgres
docker compose up -d
