# Scrutiny: to monitor SMART data of your disks across various devices

## Hub spoke model guide:
[Official Guide](https://github.com/AnalogJ/scrutiny/blob/master/docs/INSTALL_HUB_SPOKE.md){:target="_blank" rel="noopener noreferrer"}

## Hub is to be run at the server while spoke/s is/are deployed on other machines

## Firewall disk
[Pfsense/OPNsense official guide](https://github.com/AnalogJ/scrutiny/blob/master/docs/INSTALL_PFSENSE.md){:target="_blank" rel="noopener noreferrer"}


1) ```bash
    pkg install smartmontools
    ```
2) ```bash
    mkdir -p /opt/scrutiny/bin
    ```
3) ```bash
    fetch -o /opt/scrutiny/bin https://github.com/AnalogJ/scrutiny/releases/latest/download/scrutiny-collector-metrics-freebsd-amd64
    ```
4) ```bash
    chmod +x /opt/scrutiny/bin/scrutiny-collector-metrics-freebsd-amd64
    ```
5) ```bash
    /opt/scrutiny/bin/scrutiny-collector-metrics-freebsd-amd64 run --api-endpoint "http://media.lan:8780"
    ```
6) ```bash title="In OPNsense System: Settings: Cron
    Minute: */15
    Hour: *
    Day of the Month: *
    Month of the Year: *
    Day of the Week: *
    User: root
    Command: /opt/scrutiny/bin/scrutiny-collector-metrics-freebsd-amd64 run --api-endpoint "http://media.lan:8780" >/dev/null 2>&1
    ```
