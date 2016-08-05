#!/bin/bash
mkdir -p /home/mirror/sync/tmp/parallels
chown mirror:mirror /home/mirror/sync/tmp/parallels

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi

#for repo in pcs-6.0-release pcs-6.0-updates pcs-6.0-debug; do
for repo in pcs-6.0-release pcs-6.0-updates; do
  mkdir -p /home/mirror/sync/parallels.com/$repo
  rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2 --temp-dir=/home/mirror/sync/tmp/parallels --delay-updates rsync://rsync.updates.cloudserver.parallels.com/$repo /home/mirror/sync/parallels.com/$repo
done
