# Installation process for OliveTin

## Note: For some reason, setup didn't go well when doing all this via root user so I'm running these as general user.

1. Download deb or rpm package from `https://github.com/OliveTin/OliveTin/releases`:\
  `wget https://github.com/OliveTin/OliveTin/releases/download/2022-01-06/OliveTin_2022-01-06_linux_armv6.deb`

2. Make the pkg executable: `sudo chmod +x OliveTin.deb`

3. Install via:\
  `dpkg`: `dpkg -i OliveTin…​deb` or\
  `rpm`: `rpm -U OliveTin…​rpm`

4. Make a backup copy of default config at path: `/etc/OliveTin/config.yaml`\
  `sudo mv /etc/OliveTin/config.yaml /etc/OliveTin/BAK.config.yaml`

5. Copy modified config file: `sudo cp /home/putin/GitIt/services/hardware/olivetin/config.yaml /etc/OliveTin/config.yaml`

6. Start and enable OliveTin service: `sudo systemctl enable OliveTin.service --now`

7. Check status with: `sudo systemctl status OliveTin.service`


Tip: Mount `/etc/OliveTin` via ssh to edit config file\
     `sshfs root@192.168.29.12:/etc/OliveTin Workspace`

# Follow requirements.md file now