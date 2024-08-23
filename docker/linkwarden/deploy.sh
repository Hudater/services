#!/bin/sh
mkdir -p ${CFG_DIR}/linkwarden
mkdir -p ${DB_CFG_DIR}/linkwarden_postgres
docker compose up -d
