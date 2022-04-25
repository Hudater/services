### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system

#!/bin/sh
#checking if adguard dir exists in .config
if [ -d "/home/$USER/.config/adguard" ]; then
  echo "Moving /home/$USER/.config/adguard to /home/$USER/.config/adguard-BAK\n"
  mv /home/$USER/.config/adguard /home/$USER/.config/adguard-BAK
fi

#checking if tar is installed

if ! command -v tar >/dev/null 2>&1
then
  echo >&2 "tar is not installed. Enter Y to install tar or Q to quit"
  read doit
    case $doit in
      y|Y)
        # finding os name
        # https://stackoverflow.com/a/39959192
        distro=$(awk -F'=' '/^ID=/ {print tolower($2)}' /etc/*-release 2> /dev/null)
        # echo $distro

          # finding distribuition name and assigning package manager based on it
          case $distro in
            ubuntu | raspbian | debian)
              package_manager="sudo apt-get install -y"
              echo $package_manager
              ;;

            arch | manjaro)
              package_manager="sudo pacman -S --noconfirm"
              echo $package_manager
              ;;

            alpine)
              package_manager="sudo apk --update add"
              echo $package_manager
              ;;

            centos)
              package_manager="sudo yum install -y"
              echo $package_manager
              ;;

            fedora)
              package_manager="sudo dnf install -y"
              echo $package_manager
              ;;

            *)
              echo "Can't find distro name. Exiting installer"
              exit 0
              ;;
          esac

        # installing tar via $package_manager
        ${package_manager} tar
        # note: you can use this 2 var method to install multiple packages
        # package="tar"
        # ${package_manager} ${package}
        ;;

      q|Q)
        echo "qutting"; exit 0
        ;;

      *)
        echo "Invalid Option"; exit 1
        ;;
    esac
fi


# echo "Finding out cpu architecture and downloading relevant package"

cpuArch=$(uname -m)
# echo "$cpuArch"

# assigning wget with options and url to var
mkdir /home/$USER/.config/adguard
downloader="wget --no-check-certificate --content-disposition -P /home/$USER/.config/adguard/ https://github.com/AdguardTeam/AdGuardHome/releases/latest/download/"

# downloading relevant package based on architecture
# https://gist.github.com/jwebcat/5122366
case $cpuArch in
  x86_64)
    ${downloader}AdGuardHome_linux_amd64.tar.gz
    ;;

  aarch64 | arm64 | armv8)
    ${downloader}AdGuardHome_linux_arm64.tar.gz
    ;;

  armv7)
    ${downloader}AdGuardHome_linux_armv7.tar.gz
    ;;

  armv6l | armv6)
    ${downloader}AdGuardHome_linux_armv6.tar.gz
    ;;
esac

# extracting tarball
tar -C /home/$USER/.config/adguard -zxvf /home/$USER/.config/adguard/AdGuardHome*

echo "\nInstalling Adguard\n"
sudo /home/$USER/.config/adguard/AdGuardHome/AdGuardHome -s install
unset doit distro package_manager cpuArch