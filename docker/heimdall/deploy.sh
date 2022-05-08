mkdir -p "${CFG_DIR}"/heimdall
docker-compose up -d
echo "Sleeping 5 seconds"
sleep 5
docker exec -it heimdall bash -c "echo upload_max_filesize = 30M >> /config/php/php-local.ini"
docker restart heimdall