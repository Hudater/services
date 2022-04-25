### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system
# credit: https://www.e-tinkers.com/2019/06/better-way-to-install-golang-go-on-raspberry-pi/

#!/bin/sh
if (( $EUID != 0 )); then
  echo "This script must be run as root"
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
  echo -e 'PATH=$PATH:/usr/local/go/bin \nGOPATH=$HOME/golang\n' >> .profile
  source ~/.profile
  }
  
  cfTunnelInstall(){
    git clone https://github.com/cloudflare/cloudflared.git
    cd cloudflared
    make cloudflared
    go install github.com/cloudflare/cloudflared/cmd/cloudflared
    mv /root/cloudflared/cloudflared /usr/bin/cloudflared
    exit 0;
  }

  #checking if golang is already installed
  source ~/.profile
  if [ $(which go) ]; then

    #Go and Cloudflare installation section
    # check credit for command
    # explaination: reversing the ouptut of curl then cutting by char 1-20 and displaying the output of non-matching patter and reversing output again
    goLatestVer="$(echo "$GOLANG" | rev | cut -b 1-20 --complement | rev)"
    installedVer="$(go version | cut -d ' ' -f 3)" # cutting the output to show 3rd field with delimiter==space

    if [[ "$goLatestVer" = "$installedVer" ]]; then
      echo "Latest version of go is installed. Building cloudflared now"
      if [ $(which cloudflared) ]; then
        echo "Cloudflare is already installed"
        exit 0;
      else
        cfTunnelInstall
      fi
    else
      echo "Current Go installation is outtaded. Remove the old version and re-run script"
      exit 1;
    fi
  else
    echo "Installing Golang!"
    goInstallFn
    echo "Building cloudflare tunnel package now!"
    if [ $(which cloudflared) ]; then
      echo "Cloudflare is already installed"
      exit 0;
    else
      cfTunnelInstall
    fi
  fi

else
  echo "Not an armv6 system! Exiting with code 1"
  exit 1;
fi