#!/bin/sh
mkdir -p $DB_CFG_DIR/NocoDB_Root_Postgres
mkdir -p $DB_CFG_DIR/NocoDB_Postgres
docker compose up -d
