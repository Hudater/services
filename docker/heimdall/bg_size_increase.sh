# increase the max upload size in php-local.ini file:
# the command below invokes a bash shell and then echoes the line to the end of the file)
docker exec -it heimdall bash -c "echo upload_max_filesize = 30M >> /config/php/php-local.ini"
docker restart heimdall
