#!/bin/sh
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -e WATCHTOWER_NOTIFICATION_URL="$WATCHTOWER_URL"  containrrr/watchtower --run-once
