#!/bin/sh
mkdir -p ${CFG_DIR}/containerCfgDir #
mkdir -p ${CFG_DIR}/containerCfgDir/{multiple,subdirs} #
docker compose up -d
