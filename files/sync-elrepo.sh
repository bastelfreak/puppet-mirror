#!/bin/bash
mkdir -p /home/mirror/sync/tmp/elrepo

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2 --temp-dir=/home/mirror/sync/tmp/elrepo/ --delay-updates ftp.nluug.nl::elrepo /home/mirror/sync/elrepo/
