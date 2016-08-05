#!/bin/bash
mkdir -p /home/mirror/sync/tmp/alpine

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2 --temp-dir=/home/mirror/sync/tmp/alpine/ --delay-updates alpinelinux.org::alpine /home/mirror/sync/alpine/
