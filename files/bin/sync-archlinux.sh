#!/bin/bash

##
# created by bluewind
# modified by bastelfreak
##

home="/home/mirror/sync"
target="${home}/archlinux"
tmp="${home}/tmp/archlinux"
lock='/tmp/mirrorsync.lck'
#bwlimit=4096
# NOTE: you very likely need to change this since rsync.archlinux.org requires you to be a tier 1 mirror
source='rsync://mirror.selfnet.de/archlinux'
lastupdate_url="http://mirror.selfnet.de/archlinux/lastupdate"
[ ! -d "${target}" ] && mkdir -p "${target}"
[ ! -d "${tmp}" ] && mkdir -p "${tmp}"
exec 9>"${lock}"
flock -n 9 || exit
# if we are called without a tty (cronjob) only run when there are changes
if ! tty -s && diff -b <(curl -s "$lastupdate_url") "$target/lastupdate" >/dev/null; then
  exit 0
fi
if ! stty &>/dev/null; then
    QUIET="-q"
fi
rsync -rtlvH --owner=mirror:mirror --safe-links --delete-after --info=progress2 -h ${QUIET} --timeout=600 --contimeout=60 -p \
  --delay-updates --no-motd \
  --temp-dir="${tmp}" \
  --exclude='*.links.tar.gz*' \
  --exclude='/other' \
  --exclude='/sources' \
  --exclude='/aur' \
  ${source} \
  "${target}"
