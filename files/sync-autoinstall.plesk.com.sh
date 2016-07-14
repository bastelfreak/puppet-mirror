#!/bin/bash
mkdir -p /home/mirror/sync/tmp/plesk

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2 --temp-dir=/home/mirror/sync/tmp/plesk/ --delay-updates rsync://rsync.autoinstall.plesk.com/autoinstall/ /home/mirror/sync/autoinstall.plesk.com
