#!/bin/bash
mkdir -p /home/mirror/sync/tmp/gentoo
chown mirror:mirror /home/mirror/sync/tmp/gentoo

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/gentoo/ --delay-updates rsync://ftp-stud.hs-esslingen.de/gentoo/ /home/mirror/sync/gentoo/
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/gentoo/ --delay-updates rsync://ftp-stud.hs-esslingen.de/gentoo-portage/ /home/mirror/sync/gentoo-portage
