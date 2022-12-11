mkdir -p "${BAK_CFG_DIR}"/authelia
sudo chmod -R 777 "${BAK_CFG_DIR}"/authelia/
mkdir -p "${DB_CFG_DIR}"/authelia_redis
mkdir -p "${DB_CFG_DIR}"/authelia_postgres
docker compose up -d
