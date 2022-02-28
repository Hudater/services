# To make the config work, make sure to meet these requirements:

## SSH setup:

1. Switch to root user then his home directory: `sudo su` `cd`

2. Copy `.ssh` directory to root user's home dir:\
  `cp -r /home/putin/.ssh /root/.ssh`

3. Make sure the permissions are right:\
  `chmod 700 /root/.ssh` `chmod 600 /root/.ssh/authorized_keys`

4. SSH into all the machines once

5. Set `shutdown`, `reboot` and `poweroff` commands to `ALL ALL=NOPASSWD` in `sudoers` file:\
  `sudo visudo`\
  `ALL ALL=NOPASSWD: /usr/bin/reboot,/usr/bin/shutdown,/usr/bin/poweroff,/usr/sbin/reboot,/usr/sbin/shutdown,/usr/sbin/poweroff`\
  Tip: run `which reboot` etc to find binary location and replace above.


## Wake on LAN

1. Install `wakeonlan` package on the server (package name on raspbian atleast)

2. Enable wakeonlan function and pxe boot at firmware level on client devices.

3. Enable wol on OS level via `nmcli` or other command (Will update this section later) #TODO