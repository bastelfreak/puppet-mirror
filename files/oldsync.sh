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

sync_all(){
  for sync_script in $(find ${SCRIPTS_DIR} -maxdepth 1 -executable -type f -name "sync-*.sh"); do
    local filename; filename=$(basename ${sync_script})
    local mirror; mirror=${filename//sync-}
    mirror=${mirror%%\.sh}
    echo "$(current_datetime) syncing ${mirror} started" >> ${LOG_FILE}
    ${sync_script}
    echo "$(current_datetime) syncing ${mirror} finished" >> ${LOG_FILE}
  done
}

sync_all
