### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system

#!/bin/sh
echo "Uninstalling Adguard if installed via my script\n"
sudo /home/$USER/.config/adguard/AdGuardHome/AdGuardHome -s uninstall

echo "Enter M to move ~/.config/adguard to adgaurd-backup or D to delete the directory"
read userInput
case $userInput in
  M|m)
    echo "Moving adguard to adgaurd-backup"
    mv /home/$USER/.config/adguard /home/$USER/.config/adguard-backup
    exit 0
    ;;

  D|d)
    echo "Removing Adguard dir from .config"
    sudo rm -rf /home/$USER/.config/adguard
    exit 0
    ;;

  *)
    echo "Invalid input. Exiting with code 1"
    exit 1
    ;;
esac