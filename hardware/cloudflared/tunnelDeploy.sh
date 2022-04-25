### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system

#!/bin/sh
if (( $EUID != 0 )); then
  echo "This script must be run as root"
  exit 1;
fi

if [ $(which cloudflared) ]; then
  echo "Cloudflare is already installed"
  exit
else
  cfTunnelInstall
fi