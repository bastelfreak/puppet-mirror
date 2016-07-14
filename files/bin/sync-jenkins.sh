#!/bin/bash
mkdir -p /home/mirror/sync/tmp/jenkins
chown mirror:mirror /home/mirror/sync/tmp/jenkins

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlv -o -g $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/cpan/ --delay-updates rsync://rsync.osuosl.org/jenkins  /home/mirror/sync/jenkins
