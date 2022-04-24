### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system

#!/bin/bash
if (( $EUID != 0 )); then
  echo "This script must be run as root"
  exit 1
fi

#checking if cloudflared dir exists in root's home dir
if [ -d "/root/.cloudflared" ]; then
  echo "Moving /root/.cloudflared to /root/.cloudflared-BAK\n"
  mv /root/.cloudflared /root/.cloudflared-BAK
fi

# echo "Finding out cpu architecture and downloading relevant package"

cpuArch=$(uname -m)
# echo "$cpuArch"

# assigning wget with options and url to var
mkdir -p /root/.cloudflared
chmod -R 777 /root/.cloudflared
downloader="wget --no-check-certificate --content-disposition -P /root/.cloudflared/ https://github.com/cloudflare/cloudflared/releases/latest/download/"

# downloading relevant package based on architecture
# https://gist.github.com/jwebcat/5122366
case $cpuArch in

  amd64)
    ${downloader}cloudflared-linux-amd64.deb
    ;;

  # x86_64)
  #   ${downloader}cloudflared-linux-amd64.deb
  #   ;;

  aarch64 | arm64 | armv8)
    ${downloader}cloudflared-linux-arm64.deb
    ;;

  # armv7)
  #   ${downloader}AdGuardHome_linux_armv7.tar.gz
  #   ;;

  armv6l | armv6 | arm)
    ${downloader}cloudflared-linux-arm.deb
    ;;
esac

# Installing package
echo "\nInstalling Cloudflared\n"
sudo dpkg -i /root/.cloudflared/cloudflared-linux-*