mkdir -p "${BAK_CFG_DIR}"/authelia
sudo chmod -R 777 "${BAK_CFG_DIR}"/authelia/
mkdir -p "${CFG_DIR}"/authelia
docker-compose up -d