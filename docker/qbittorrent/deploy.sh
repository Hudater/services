#!/usr/bin/env bash
mkdir -p "${CFG_DIR}"/qbittorrent
mkdir -p "${DATA_DIR}"/Torrents/{complete,downloading,ISO,Movies,MusicArr,Prowlarr,Shows,torfiles/{added,complete}}
docker compose up -d
