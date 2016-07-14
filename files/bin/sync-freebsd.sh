#!/bin/bash
mkdir -p /home/mirror/sync/tmp/freebsd
chown mirror:mirror /home/mirror/sync/tmp/freebsd

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/freebsd --delay-updates rsync://ftp3.de.FreeBSD.org/FreeBSD /home/mirror/sync/freebsd
