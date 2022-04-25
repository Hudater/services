### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system

#!/bin/sh
echo "WARNING: Use this script if tunnel is installed via CLI\n"
echo "Enter Y/y to delete tunnel or N/n to exit"
read userInput
case $userInput in
  Y|y)
    tunnelList="cloudflared tunnel list"
    echo "Your tunnels are: $(eval $tunnelList)"
    echo "\nEnter your tunnel name to delete: "
    read userInput
    echo $userInput
    cloudflared tunnel delete $userInput
    echo "\nDo you want to DELETE CLOUDFLARED BINARY too: "
    read binDelInput
    case $binDelInput in
      Y|y)
        echo "Uninstalling cloudflared bianry"
        sudo dpkg -r cloudflared
        exit 0
        ;;
      N|n)
        echo "Cloudflared binary is untouched, Exiting..."
        exit 0
        ;;
      *)
        echo "Invalid input. Exiting with code 1"
        exit 1
        ;;
    esac

  N|n)
    echo "Your tunnel is untouched. Exiting..."
    exit 0
    ;;

  *)
    echo "Invalid input. Exiting with code 1"
    exit 1
    ;;
esac

echo "Uninstalling cloudflared bianry"
sudo dpkg -r cloudflared
exit 0;