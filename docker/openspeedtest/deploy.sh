#!/bin/bash
CREATE_DIRS=( "${CFG_DIR}"/openspeedtest{config,letsencrypt} )
mkdir -p "${CREATE_DIRS[@]}"
docker compose up -d
