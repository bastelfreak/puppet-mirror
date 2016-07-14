#!/bin/bash
mkdir -p /home/mirror/sync/tmp/epel
chown mirror:mirror /home/mirror/sync/tmp/epel
quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2 --temp-dir=/home/mirror/sync/tmp/epel/ --delay-updates fedora.tu-chemnitz.de::fedora-epel /home/mirror/sync/epel/
