#!/bin/sh
mkdir -p ${CFG_DIR}/unmanic
mkdir -p /storage/unmanic/cache
#mkdir -p /storage/unmanic/Library
docker compose up -d
