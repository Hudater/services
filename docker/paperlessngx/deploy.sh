#!/bin/sh
mkdir -p ${CFG_DIR}/paperless/cfg
mkdir -p ${CFG_DIR}/paperless/data
mkdir -p ${DB_CFG_DIR}/redis_paperless
docker compose up -d
