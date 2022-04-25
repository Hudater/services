### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system

#!/bin/sh
if (( $EUID != 0 )); then
  echo "This script must be run as root"
  exit 1;
fi

printf "WARNING: Must have already logged in your cloudflare account in browser beofre running script\n"
printf "If logged in, Enter Y/y to continue else any other key to exit\n"
read contLogin
case $contLogin in
  Y|y)
    if [ $(which cloudflared) ]; then
      cloudflared tunnel login

      printf "Enter name for your tunnel: "
      read tunName
      cloudflared tunnel create $tunName

      wget -O /root/.cloudflared/config.yml https://raw.githubusercontent.com/Hudater/services/main/hardware/cloudflared/config.yml
      read -s -n 1 -p "Copy tunnel UUID and press ENTER to open config file in nano"
      nano /root/.cloudflared/config.yml

      printf "Enter your desired hostname (ex: home.example.com): "
      read hostName
      cloudflared tunnel route dns $tunName $hostName

      cloudflared service install
      systemctl enable --now cloudflared.service

      unset contLogin tunName hostName
      exit 0;
    else
      printf "Cloudflared is not installed. Try: https://github.com/Hudater/services/blob/main/hardware/cloudflared/debInstall.sh\n"
    fi
    ;;

  *)
    printf "Exiting script with code 1\n"
    unset contLogin
    exit 1;
    ;;
esac