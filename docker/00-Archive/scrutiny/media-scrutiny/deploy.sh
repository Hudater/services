mkdir -p "${DB_CFG_DIR}"/scrudb
mkdir -p "${CFG_DIR}"/scrutiny
docker compose up -d
# echo "Sleeping for 5 seconds"
# sleep 5
# docker exec -it scrumd scrutiny-collector-metrics run
