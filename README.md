# A repo of 'docker-compose', 'docker run' and other Selfhosted things, configs and other files

Running these on `Acer-Laptop`, `Main-PC`, `RPI-4`, & `RPI-Zero` with `Artix Runit`, `Arch BTW`, `Manjaro ARM64` & `Arch ARM` respectively
Most of these should work on x86_64 and ARMv8 too

`Acer-Laptop` has all storage attached and runs anything that needs access to media
`Main-PC` not dedicated for server. My main PC
`RPI-4` runs anything without direct media access
`RPI-Zero` runs adguard, ddns and other critical ops

First port is for Web GUI in compose file or run files (`host:container` or `source:destination`)

## Service List Section

### Bare Metal Services

- Crontab
  - Device: `Acer-Laptop`
  - Downloading a playlist every hour to `/mnt/Media/Music`
  - Script location: `/mnt/IT/coding/Scripts/ytmusic.sh`

### Docker based services

#### Often Deployed Containers

- Adguard-home
  - Adblock etc just like pi-hole
  - Device: `RPI-Zero`
  - Ports: `53` `80` `443` `3000` `853` `784` `8853` `5443`
  - Linuxserver.io image
  - <https://hub.docker.com/r/adguard/adguardhome>

- Filebrowser
  - Web based file browser
  - Device: `Acer-Laptop`
  - Ports: `420`
  - Image by hurlenko on dockerhub
  - <https://hub.docker.com/r/hurlenko/filebrowser>

- Heimdall
  - Dashboard for all services
  - Device: `RPI-4`
  - Ports: `82` `444`
  - Linuxserver.io image
  - <https://hub.docker.com/r/linuxserver/heimdall>

- Jellyfin
  - Media Server
  - Device: `Acer-Laptop`
  - Network mode: host
  - Official image
  - <https://hub.docker.com/r/jellyfin/jellyfin>

- Olivetin
  - Web based Command runner
  - Device: `RPI-4`
  - Ports: `1337`
  - Official image
  - <https://hub.docker.com/r/jamesread/olivetin>

- Portainer-agent
  - Agent for portainer
  - Device: `Acer-Laptop, Main-PC, RPI-Zero`
  - Ports: `9001`
  - Network mode: bridge
  - Portainer official image
  - <https://hub.docker.com/r/portainer/agent>

- Portainer-ce
  - Web GUI for docker
  - Device: `RPI-4`
  - Ports: `9000` `8000`
  - Network mode: bridge
  - Portainer official image
  - <https://hub.docker.com/r/portainer/portainer-ce>

- qBitTorrent
  - Torrent with Vue theme
  - Device: `Acer-Laptop`
  - Ports: `4000`
  - Hotio.dev image
  - <https://hotio.dev/containers/qbittorrent/>

- Scrutiny
  - Disk monitoring via http
  - Device: `Acer-Laptop, Main-PC, RPI-4, RPI-Zero`
  - Ports: `8780`
  - Linuxserver.io image
  - <https://hub.docker.com/r/linuxserver/scrutiny>

- Syncthing
  - Multi way folder sync
  - Device: `Acer-Laptop, Main-PC, RPI-4, RPI-Zero`
  - Network mode: host
  - Linuxserver.io image
  - <https://hub.docker.com/r/syncthing/syncthing>

- Uptime-Kuma
  - Uptime status monitor and dashboard
  - Device: `RPI-4`
  - Ports: `3001`
  - Official image by louislam
  - <https://hub.docker.com/r/louislam/uptime-kuma>

- Watchtower
    - Auto update docker images and redeploy containers
    - Device: `Acer-Laptop, Main-PC, RPI-4`
    - Bridge mode network
    - Official network
    - <https://hub.docker.com/r/containrrr/watchtower>

#### Rarely Deployed Containers

- Deluge
  - Torrent with gilbn's theme
  - Ports: `8112`  `58946` `58846`
  - Linuxserver.io image
  - <https://hub.docker.com/r/linuxserver/deluge>

- Flood-Rtorrent
  - Rtorrent instance with FloodUI
  - Ports: `3001` `6881`
  - Image by jesec on dockerhub
  - <https://hub.docker.com/r/jesec/rtorrent-flood>

- FreshRSS
  - RSS feed
  - Ports: `89`
  - Linuxserver.io image
  - <https://hub.docker.com/r/linuxserver/freshrss>

 - Guacamole
  - Web based remote gateway
  - Device: `RPI-4`
  - Ports: `8888`
  - Image by maxwaldorf on dockerhub
  - <https://hub.docker.com/r/maxwaldorf/guacamole/> 

- Libreoffice
  - Self hosted Libreoffice instance
  - Ports: `3003`
  - Linuxserver.io image
  - <https://hub.docker.com/r/linuxserver/libreoffice>

- Miniflux
  - Self hosted RSS reader
  - Ports: `88`
  - Official image
  - <https://hub.docker.com/r/miniflux/miniflux>

- Organizr
  - Web dashboard for services
  - Ports: `83` `443`
  - Official image
  - <https://hub.docker.com/r/organizr/organizr>

- Pihole
  - DNS level ad blocker
  - Ports: `81` `443`  `67` `53`
  - Official image
  - <https://hub.docker.com/r/pihole/pihole>

  - Youtubedl-Material
  - Web GUI for yt-dl
  - Device: `RPI-4`
  - Ports: `8998`
  - Image by tzahi12345 on dockerhub
  - <https://hub.docker.com/r/tzahi12345/youtubedl-material>


# Link to other repos and resources for selfhosters

- List of self-hostable services: <https://github.com/awesome-selfhosted/awesome-selfhosted>
- Awesome-sysadmin (deprecated but new link gives 404): <https://github.com/awesome-foss/awesome-sysadmin>
- Similar docker-compose and cfg list: <https://github.com/abhilesh/self-hosted_docker_setups>
- Selfhost Wiki by Geeked: <https://thehomelab.wiki>
- Documentation by Techno Tim: <https://techno-tim.github.io/>