#!/bin/bash
mkdir -p /home/mirror/sync/tmp/cygwin
chown mirror:mirror /home/mirror/sync/tmp/cygwin

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/cygwin/ --delay-updates rsync://cygwin.com/ftp /home/mirror/sync/cygwin
