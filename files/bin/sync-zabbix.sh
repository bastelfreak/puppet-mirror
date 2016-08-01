#!/bin/bash
mkdir -p /home/mirror/sync/tmp/zabbix
chown mirror:mirror /home/mirror/sync/tmp/zabbix

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlv -o -g $quiet --owner=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/zabbix/ --delay-updates rsync://repo.zabbix.com/mirror  /home/mirror/sync/zabbix
