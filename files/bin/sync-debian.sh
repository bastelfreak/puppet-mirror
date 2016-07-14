#!/bin/bash
mkdir -p /home/mirror/sync/tmp/debian
chown mirror:mirror /home/mirror/sync/tmp/debian

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/debian/ --delay-updates rsync://ftp.de.debian.org/debian /home/mirror/sync/debian
