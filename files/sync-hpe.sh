#!/bin/bash
mkdir -p /home/mirror/sync/tmp/hpe
mkdir -p /home/mirror/sync/hpe/SDR
mkdir -p /home/mirror/sync/hpe/VIBS
mkdir -p /home/mirror/sync/hpe/FIRMWARE
chown mirror:mirror /home/mirror/sync/tmp/hpe
chown mirror:mirror /home/mirror/sync/hpe/SDR
chown mirror:mirror /home/mirror/sync/hpe/VIBS
chown mirror:mirror /home/mirror/sync/hpe/FIRMWARE

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/hpe/ --delay-updates rsync://rsync.linux.hpe.com/SDR /home/mirror/sync/hpe/SDR
#rsync -rptlvog --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/hpe/ --delay-updates rsync://rsync.linux.hpe.com/VIBS /home/mirror/sync/hpe/VIBS
#rsync -rptlvog --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/hpe/ --delay-updates rsync://rsync.linux.hpe.com/FIRMWARE /home/mirror/sync/hpe/FIRMWARE
