# This setup works on raspbian armv6. Package names might change with distro. Issues with other things like visudo, selinux etc might arise too.

# To make the config work, make sure to meet these requirements:

## SSH setup:

1. Switch to root user then his home directory: `sudo su` `cd`

2. Copy `.ssh` directory to root user's home dir:\
  `cp -r /home/$USER/.ssh /root/.ssh`

3. Make sure the permissions are right:\
  `chmod 700 /root/.ssh` `chmod 600 /root/.ssh/authorized_keys`

4. SSH into all the machines once

5. Set `shutdown`, `reboot` and `poweroff` commands to `ALL ALL=NOPASSWD` in `sudoers` file:\
  `sudo visudo`\
  `ALL ALL=NOPASSWD: /sbin/poweroff,/sbin/reboot,/sbin/shutdown`\
  Tip: Add this line after `%wheel ALL=(ALL) ALL` line

*interface*
## Wake on LAN

#### [Arch Wiki for WoL](https://wiki.archlinux.org/title/Wake-on-LAN)

1. Install `wakeonlan` package on the server: `sudo apt install wakeonlan -y`

2. Enable wakeonlan function and pxe boot at firmware level on client devices.

3. Enable wol on OS level:
    - `ip a` to look at all network interfaces
    - `ethtool interface | grep Wake-on` to get current wake-on-lan status (replace interface with your etherner port id)
    - `vim /etc/systemd/system/wol@.service`
    - ```
      [Unit]
      Description=Wake-on-LAN for %i
      Requires=network.target
      After=network.target

      [Service]
      ExecStart=/usr/sbin/ethtool -s %i wol g
      Type=oneshot

      [Install]
      WantedBy=multi-user.target
       ````
      ### Note: replace /ethtool binary location accordingly
    - `sudo systemctl enable wol@interface --now` Replace interface with your interface name
    - Reboot twice