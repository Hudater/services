<!-- https://stackoverflow.com/questions/49450422/how-to-enable-logrotation-for-traefik -->


## change `$BAK_CFG_DIR` to your config dir path
```vim /etc/logrotate.d/traefik
  $BAK_CFG_DIR/traefik/logs/access.log {
    size 100M
    rotate 5
    missingok
    notifempty
    postrotate
      docker kill --signal=USR1 traefik
    endscript
  }
```

### Run:
`sudo logrotate /etc/logrotate.conf --debug`