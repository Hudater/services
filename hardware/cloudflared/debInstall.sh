### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system

#!/bin/bash
if (( $EUID != 0 )); then
  echo "This script must be run as root"
  exit 1
fi



if [ $(which cloudflared) ]; then
  echo "Cloudflare is already installed"
  exit 0;
else

  cpuArch=$(uname -m)

  #checking if cloudflared dir exists in root's home dir
  if [ -d "/root/.cloudflared" ]; then
    echo "Moving /root/.cloudflared to /root/.cloudflared-BAK\n"
    mv /root/.cloudflared /root/.cloudflared-BAK
  fi

  # directory setup
  mkdir -p /root/.cloudflared
  chmod -R 777 /root/.cloudflared
  
  # assigning wget with options and url to var
  downloader="wget --no-check-certificate --content-disposition -P /root/.cloudflared/ https://github.com/cloudflare/cloudflared/releases/latest/download/"

  # downloading relevant package based on architecture
  # https://gist.github.com/jwebcat/5122366
  case $cpuArch in

    amd64 | x86_64)
      ${downloader}cloudflared-linux-amd64.deb
      ;;

    x86)
      ${downloader}cloudflared-linux-386.deb
      ;;

    aarch64 | arm64 | armv8)
      ${downloader}cloudflared-linux-arm64.deb
      ;;

    armv6l | armv6 | arm)
      ${downloader}cloudflared-linux-arm.deb
      ;;
  esac

  # Installing package
  printf "\nInstalling Cloudflared\n"
  sudo dpkg -i /root/.cloudflared/cloudflared-linux-*


  printf "\nIf this installation method failed for you, clean the files and build from source. For pi-zero, a build script is in the repo\n"
  exit 0;
fi