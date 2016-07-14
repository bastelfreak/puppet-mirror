#!/bin/bash
mkdir -p /home/mirror/sync/tmp/centos

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/centos/ --delay-updates rsync://centos.mirrors.ovh.net/ftp.centos.org/ /home/mirror/sync/centos
