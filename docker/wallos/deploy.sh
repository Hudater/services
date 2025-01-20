#!/bin/sh
mkdir -p ${DB_CFG_DIR}/wallos_db
mkdir -p ${CFG_DIR}/wallos/logos
docker compose up -d
