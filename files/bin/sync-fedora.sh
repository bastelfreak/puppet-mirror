#!/bin/bash
mkdir -p /home/mirror/sync/tmp/fedora
mkdir -p /home/mirror/sync/fedora/enchilada
mkdir -p /home/mirror/sync/fedora/alt
mkdir -p /home/mirror/sync/fedora/archive
mkdir -p /home/mirror/sync/fedora/secondary
chown mirror:mirror /home/mirror/sync/tmp/fedora
chown mirror:mirror /home/mirror/sync/fedora/enchilada
chown mirror:mirror /home/mirror/sync/fedora/archive
chown mirror:mirror /home/mirror/sync/fedora/secondary

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/fedora/ --delay-updates rsync://mirrors.nic.cz/fedora-enchilada/ /home/mirror/sync/fedora/enchilada
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/fedora/ --delay-updates rsync://mirrors.nic.cz/fedora-alt/ /home/mirror/sync/fedora/alt
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/fedora/ --delay-updates rsync://mirrors.nic.cz/fedora-archive/ /home/mirror/sync/fedora/archive
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/fedora/ --delay-updates rsync://mirrors.nic.cz/fedora-secondary/ /home/mirror/sync/fedora/secondary
