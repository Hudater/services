#!/bin/bash
set -e
CREATE_DIRS=( "${DB_CFG_DIR}/crowdsec_db" "${CFG_DIR}/crowdsec/" )
mkdir -p "${CREATE_DIRS[@]}"
docker compose up -d --force-recreate
sudo tee -a /etc/cron.d/crowdsec > /dev/null <<EOT
0 0 * * 0 docker exec crowdsec cscli hub update && docker exec crowdsec cscli hub upgrade
EOT