mkdir -p "${CFG_DIR}"/scrutiny
docker compose up -d
echo "Sleeping for 5 seconds"
sleep 5
docker exec -it scrupi scrutiny-collector-metrics run