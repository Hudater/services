docker-compose up -d
docker cp rickroll:/etc/nginx/conf.d/default.conf .
sed -i '4d' default.conf
docker cp default.conf rickroll:/etc/nginx/conf.d/default.conf
docker restart rickroll
rm default.conf