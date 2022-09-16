#!/bin/sh
mkdir -p ${CFG_DIR}/pihole/etc-pihole
mkdir -p ${CFG_DIR}/pihole/etc-dnsmasq.d
docker compose up -d
