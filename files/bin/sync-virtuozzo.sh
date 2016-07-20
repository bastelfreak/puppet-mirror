#!/bin/bash
mkdir -p /home/mirror/sync/tmp/virtuozzo
chown mirror:mirror /home/mirror/sync/tmp/virtuozzo

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi

for repo in vzlinux-6.0-i386-os vzlinux-6.0-x86_64-os vzlinux-6.0-i386-updates  vzlinux-6.0-x86_64-updates vzlinux-6.0-i386-debug vzlinux-6.0-x86_64-debug; do
	mkdir -p /home/mirror/sync/repo.virtuozzo.com/$repo
  rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2 --temp-dir=/home/mirror/sync/tmp/virtuozzo/ --delay-updates rsync://repo.virtuozzo.com/$repo /home/mirror/sync/repo.virtuozzo.com/$repo
done
