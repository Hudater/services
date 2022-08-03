#!/bin/sh

## Setting variables
FILE=${BAK_CFG_DIR}/prometheus/prometheus.yml
FETCH="wget --no-check-certificate --content-disposition -P ${BAK_CFG_DIR}/prometheus https://raw.githubusercontent.com/Hudater/services/main/docker/monitoring/prometheus.yml"

## check if file exists and is empty; if empty then fetch new file; if !empty then continue
if test -f "$FILE"; then
  echo "File exists."
  if [ -s "$FILE" ]; then
    # The file is not-empty.
    echo "\nFile Not empty. Continuing installation!\n"
  else
    # The file is empty.
    echo "\nFile Empty. Fetching new file!\n"
    rm $FILE
    $FETCH
  fi
else
  echo "\nFetching file\n"
  mkdir -p ${BAK_CFG_DIR}/prometheus
  $FETCH
fi

docker compose up -d
