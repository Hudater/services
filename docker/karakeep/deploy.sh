#!/bin/bash
mkdir -p "${BAK_CFG_DIR}/karakeep/data"
mkdir -p "${BAK_CFG_DIR}/karakeep/karakeep-dash"
docker compose up -d --force-recreate
