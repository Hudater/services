# Scrutiny: to monitor SMART data of your disks across various devices

## Hub spoke model guide:
[Official Guide](https://github.com/AnalogJ/scrutiny/blob/master/docs/INSTALL_HUB_SPOKE.md){:target="_blank" rel="noopener noreferrer"}

## Hub is to be run at the server while spoke/s is/are deployed on other machines

## Firewall disk
[Pfsense official guide](https://github.com/AnalogJ/scrutiny/blob/master/docs/INSTALL_PFSENSE.md){:target="_blank" rel="noopener noreferrer"}
[OPNsense guide](https://fingerlessgloves.me/2021/04/14/scrutiny-on-opnsense-smart-monitoring/){:target="_blank" rel="noopener noreferrer"}

1) ```bash
    pkg install smartmontools
    ```
2) ```bash
    mkdir -p /conf/scrutiny/
    ```
3) ```bash
    fetch -o /conf/scrutiny/ https://github.com/AnalogJ/scrutiny/releases/latest/download/scrutiny-collector-metrics-freebsd-amd64
    ```
4) ```bash
    chmod +x /conf/scrutiny/scrutiny-collector-metrics-freebsd-amd64
    ```
5) ```bash title="vim /usr/local/opnsense/service/conf/actions.d/actions_scrutinyCollector.conf"
    [scrutinyCollector]
    command:/conf/scrutiny/scrutiny-collector-metrics-freebsd-amd64 run --config /conf/scrutiny/collector.yaml --api-endpoint http://media.lan:8780
    type:script_output
    message:Running Scrutiny Collector
    description:Scrutiny Collector
    ```
7) ```bash
    service configd restart
    ```
8) ```bash title="In OPNsense System: Settings: Cron"
    Enabled: tick
    Minute: 1
    Hour: 0
    Day of the Month: *
    Month of the Year: *
    Day of the Week: *
    Command: Scrutiny Collector
    Description: Scutiny collector for SMART data
    ```
