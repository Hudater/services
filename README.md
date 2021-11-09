# A repo of 'docker-compose', 'docker run' and other Selfhosted things, configs and other files

Running these on `RPI-4`, `Acer laptop` & `RPI-Zero` with `Manjaro ARM64`, `Arch BTW` & `Arch ARM` respectively
Most of these should work on x86_64 and ARMv8 too

`RPI-4` acts as the main server with main storage attached to it
`Acer laptop` runs media server and other heavy stuff
`RPI-Zero` runs adguard. May add wireguard later

First port is for Web GUI in compose file or run files (`host:container` or `source:destination`)

## Service List Section

### Bare Metal Services

- Crontab
  - Device: `RPI-4`
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
  - Device: `RPI-4`
  - Ports: `420`
  - Image by hurlenko on dockerhub
  - <https://hub.docker.com/r/hurlenko/filebrowser>

- Guacamole
  - Web based remote gateway
  - Device: `RPI-4`
  - Ports: `8888`
  - Image by maxwaldorf on dockerhub
  - <https://hub.docker.com/r/maxwaldorf/guacamole/>

- Heimdall
  - Dashboard for all services
  - Device: `RPI-4`
  - Ports: `82` `444`
  - Linuxserver.io image
  - <https://hub.docker.com/r/linuxserver/heimdall>

- Jellyfin
  - Media Server
  - Device: `Acer laptop`
  - Network mode: host
  - Official image
  - <https://hub.docker.com/r/jellyfin/jellyfin>

- Portainer-agent
  - Agent for portainer
  - Device: `Acer laptop`
  - Ports: `9001`
  - Network mode: bridge
  - Portainer official image
  - <https://hub.docker.com/r/portainer/agent>

- Portainer-ce
  - Web GUI for docker
  - Device: `RPI-4`
  - Ports: `9000`   `8000`
  - Network mode: bridge
  - Portainer official image
  - <https://hub.docker.com/r/portainer/portainer-ce>

- qBitTorrent
  - Torrent with Vue theme
  - Device: `RPI-4`
  - Ports: `4000`
  - Hotio.dev image
  - <https://hotio.dev/containers/qbittorrent/>

- Scrutiny
  - Disk monitoring via http
  - Device: `RPI-4 and Acer laptop`
  - Ports: `8780`
  - Linuxserver.io image
  - <https://hub.docker.com/r/linuxserver/scrutiny>

- Syncthing
  - Multi way folder sync
  - Device: `RPI-4 and Acer laptop`
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
    - Device: `RPI-4 and Acer laptop`
    - Bridge mode network
    - Official network
    - <https://hub.docker.com/r/containrrr/watchtower>

- Youtubedl-Material
  - Web GUI for yt-dl
  - Device: `RPI-4`
  - Ports: `8998`
  - Image by tzahi12345 on dockerhub
  - <https://hub.docker.com/r/tzahi12345/youtubedl-material>

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


# Link to other repos and resources for selfhosters

- List of self-hostable services: <https://github.com/awesome-selfhosted/awesome-selfhosted>
- Awesome-sysadmin (deprecated but new link gives 404): <https://github.com/awesome-foss/awesome-sysadmin>
- Similar docker-compose and cfg list: <https://github.com/abhilesh/self-hosted_docker_setups>
- Selfhost Wiki by Geeked: <https://thehomelab.wiki>