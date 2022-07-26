#!/bin/sh

## Setting variables
FILE=${BAK_CFG_DIR}/prometheus/prometheus.yml
FETCH="wget --no-check-certificate --content-disposition -P ${BAK_CFG_DIR}/prometheus https://github.com/AdguardTeam/AdGuardHome/releases/latest/download/"

## create file if !exists
if test -f "$FILE"; then
    echo "$FILE exists."
  else
    echo "Fail"
fi
