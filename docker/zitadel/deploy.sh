#!/bin/bash
CREATE_DIRS=( "${BAK_CFG_DIR}/zitadel" "${DB_CFG_DIR}/zitadel_cockroach" )
mkdir -p "${CREATE_DIRS[@]}"
ls -alh "${CREATE_DIRS[@]}"
docker compose up -d
