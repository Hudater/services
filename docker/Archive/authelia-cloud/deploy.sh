mkdir -p "${BAK_CFG_DIR}"/authelia-cloud
sudo chmod -R 777 "${BAK_CFG_DIR}"/authelia-cloud/
mkdir -p "${DB_CFG_DIR}"/redis_authelia
mkdir -p "${DB_CFG_DIR}"/mariadb_authelia
docker-compose up -d
