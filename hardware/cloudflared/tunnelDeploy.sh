### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system

#!/bin/sh
if (( $EUID != 0 )); then
  echo "This script must be run as root"
  exit 1;
fi

printf "WARNING: Must have already logged in your cloudflare account beofre running script\n"
printf "If logged in, Enter Y/y to continue else any other key to exit\n"
read contLogin
case $contLogin in
  Y|y)
    if [ $(which cloudflared) ]; then
      cloudflared tunnel login

      printf "Enter name for your tunnel: "
      read tunName
      cloudflared tunnel create $tunName

      read -s -n 1 -p "Copy tunnel UUID and press enter to open config file"
      # printf "Enter name for your tunnel: "
      # read tunName
      # echo $tunName
    else
      printf "Cloudflared is not installed. Try: https://github.com/Hudater/services/blob/main/hardware/cloudflared/debInstall.sh"
    fi
      ;;

  *)
    printf "Exiting script with code 1"
    unset contLogin
    exit 1;
    ;;
esac