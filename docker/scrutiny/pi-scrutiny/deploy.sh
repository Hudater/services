mkdir -p "${CFG_DIR}"/scrutiny
docker-compose up -d
echo "Sleeping for 10 seconds"
sleep 10
../startup.sh