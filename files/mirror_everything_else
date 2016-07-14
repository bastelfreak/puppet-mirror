#!/bin/bash

LOG_FILE=/var/log/mirror-sync.log
MIRROR_DIR=/home/mirror/sync
SCRIPTS_DIR=/home/mirror/scripts

current_datetime(){
  date=$(date '+%Y-%m-%d %H:%M:%S')
  echo "$date"
}

if ! mountpoint -q -- ${MIRROR_DIR}; then
  echo "$(current_datetime) ${MIRROR_DIR} not mounted. exiting." >> ${LOG_FILE}
  exit 1
fi


mirror() {
  [ -n "$1" ] || return
  local sync_script; sync_script="$1"
  local filename; filename=$(basename "${sync_script}")
  local mirror; mirror=${filename//sync-}
  mirror=${mirror%%\.sh}
  echo "$(current_datetime) syncing ${mirror} started" >> ${LOG_FILE}
  ${sync_script}
  echo "$(current_datetime) syncing ${mirror} finished" >> ${LOG_FILE}
}
mirror_all(){
  while read -r sync_script; do
  mirror "$sync_script"
  done < "$(find ${SCRIPTS_DIR} -maxdepth 1 -executable -type f -name "sync-*.sh")"
}

mirror_distributions() {
  # after some tests we could add freebsd and openbsd, they need a huge amount of diskspace
  # also currently probably nobody uses it
  for sync_script in centos debian epel elrepo fedora gentoo repoforge ubuntu; do
    sync_script="${SCRIPTS_DIR}/sync-${sync_script}.sh"
    mirror "$sync_script"
  done
}

mirror_everything_else() {
  # We really need a rubygems mirror, but this should probably be solved in another way
  # we could mirror cpan, but we do not really use it
  for sync_script in cygwin dell foreman hpe jenkins postgresql puppet autoinstall.plesk.com; do
    sync_script="${SCRIPTS_DIR}/sync-${sync_script}.sh"
    mirror "$sync_script"
  done
}

usage() {
  echo "this is our mirror script"
  echo "please use mirror_all, mirror_distributions or mirror_everything_else"
  echo "todo: update the script to also accept \$1"
}

checkparams() {
  [ -n "$1" ] || usage
  case $1 in
    mirror_all) mirror_all;;
    mirror_distributions) mirror_distributions;;
    mirror_everything_else) mirror_everything_else;;
    usage) usage;;
  esac
}

cmd=$(basename "$0")
case $cmd in
  mirror_all) mirror_all;;
  mirror_distributions) mirror_distributions;;
  mirror_everything_else) mirror_everything_else;;
  sync.sh) checkparams "$1";;
esac
