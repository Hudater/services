### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system
# credit: https://www.e-tinkers.com/2019/06/better-way-to-install-golang-go-on-raspberry-pi/

#!/bin/sh
if (( $EUID != 0 )); then
  printf "This script must be run as root"
  exit 1;
fi

# checking if os is armhf; true==continue else exit
if [[ $(uname -m) = "armv6l" || $(uname -m) = "armv6" || $(uname -m) = "arm" ]]; then

  # prep
  export GOLANG="$(curl -s https://go.dev/dl/ | awk -F[\>\<] '/linux-armv6l/ && !/beta/ {print $5;exit}')"
  # function declaration
  goInstallFn() {
  wget https://golang.org/dl/$GOLANG
  tar -C /usr/local -xzf $GOLANG
  rm $GOLANG
  unset GOLANG
  printf 'PATH=$PATH:/usr/local/go/bin \nGOPATH=$HOME/golang\n' >> ~/.profile
  source ~/.profile
  }
  
  cfTunnelInstall(){
    git clone https://github.com/cloudflare/cloudflared.git
    cd cloudflared
    make cloudflared
    go install github.com/cloudflare/cloudflared/cmd/cloudflared
    mv /root/cloudflared/cloudflared /usr/bin/cloudflared
  }

  #checking if golang is already installed
  source ~/.profile
  if [ $(which go) ]; then

    #Go and Cloudflare installation section
    # check credit for command
    # explaination: reversing the ouptut of curl then cutting by char 1-20 and displaying the output of non-matching patter and reversing output again
    goLatestVer="$(printf "$GOLANG" | rev | cut -b 1-20 --complement | rev)"
    installedVer="$(go version | cut -d ' ' -f 3)" # cutting the output to show 3rd field with delimiter==space

    if [[ "$goLatestVer" = "$installedVer" ]]; then
      printf "Latest version of go is installed. Building cloudflared now"
      if [ $(which cloudflared) ]; then
        printf "Cloudflare is already installed"
        unset goLatestVer installedVer
        exit 0;
      else
        cfTunnelInstall
        unset goLatestVer installedVer
        exit 0;
      fi
    else
      printf "Current Go installation is outtaded. Remove the old version and re-run script"
      unset goLatestVer installedVer
      exit 1;
    fi
  else
    printf "Installing Golang!"
    goInstallFn
    printf "Building cloudflare tunnel package now!"
    if [ $(which cloudflared) ]; then
      printf "Cloudflare is already installed"
      unset goLatestVer installedVer
      exit 0;
    else
      cfTunnelInstall
      unset goLatestVer installedVer
      exit 0;
    fi
  fi

else
  printf "\nNot an armv6 system! Try: https://github.com/Hudater/services/blob/main/hardware/cloudflared/debInstall.sh"
  exit 1;
fi