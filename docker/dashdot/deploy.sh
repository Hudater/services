DEFAULT_INTERFACE_PATH=$(readlink -f /sys/class/net/$(ip addr show | awk '/inet.*brd/{print $NF; exit}')) docker-compose up -d
