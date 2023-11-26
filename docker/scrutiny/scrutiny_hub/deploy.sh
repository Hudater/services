#!/bin/sh
mkdir -p "${DB_CFG_DIR}/scrutiny_influxdb2/config"
mkdir -p "${DB_CFG_DIR}/scrutiny_influxdb2/db"
mkdir -p "${BAK_CFG_DIR}/scrutiny"
docker compose up -d
