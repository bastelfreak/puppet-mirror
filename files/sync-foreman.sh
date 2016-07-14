#!/bin/bash
mkdir -p /home/mirror/sync/tmp/theforeman
mkdir -p /home/mirror/sync/tmptheforeman/deb
mkdir -p /home/mirror/sync/tmp/theforeman/yum
mkdir -p /home/mirror/sync/tmp/theforeman/stagingdeb
mkdir -p /home/mirror/sync/tmp/theforeman/downloads
chown mirror:mirror /home/mirror/sync/tmp/theforeman
chown mirror:mirror /home/mirror/sync/tmp/theforeman/deb
chown mirror:mirror /home/mirror/sync/tmp/theforeman/yum
chown mirror:mirror /home/mirror/sync/tmp/theforeman/stagingdeb
chown mirror:mirror /home/mirror/sync/tmp/theforeman/downloads

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/theforeman/ --delay-updates rsync://deb.theforeman.org/dep /home/mirror/sync/theforeman/deb
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/theforeman/ --delay-updates rsync://deb.theforeman.org/stagingdeb /home/mirror/sync/theforeman/stagingdeb
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/theforeman/ --delay-updates rsync://deb.theforeman.org/downloads /home/mirror/sync/theforeman/downloads
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/theforeman/ --delay-updates rsync://deb.theforeman.org/yum /home/mirror/sync/theforeman/yum
