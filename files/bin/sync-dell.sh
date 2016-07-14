#!/bin/bash
mkdir -p /home/mirror/sync/tmp/dell
mkdir -p /home/mirror/sync/dell/repo
mkdir -p /home/mirror/sync/dell/git
mkdir -p /home/mirror/sync/dell/files
chown mirror:mirror /home/mirror/sync/tmp/dell
chown mirror:mirror /home/mirror/sync/dell/repo
chown mirror:mirror /home/mirror/sync/dell/git
chown mirror:mirror /home/mirror/sync/dell/files
quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2 --temp-dir=/home/mirror/sync/tmp/dell/ --delay-updates rsync://linux.dell.com/repo /home/mirror/sync/dell/repo
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2 --temp-dir=/home/mirror/sync/tmp/dell/ --delay-updates rsync://linux.dell.com/git /home/mirror/sync/dell/git
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2 --temp-dir=/home/mirror/sync/tmp/epel/ --delay-updates rsync://linux.dell.com/files /home/mirror/sync/dell/files
