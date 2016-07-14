#!/bin/bash
mkdir -p /home/mirror/sync/tmp/ubuntu
rsync -rptlvog --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/ubuntu/ --delay-updates rsync://mirror.serverloft.eu/ubuntu-linux/ubuntu/ /home/mirror/sync/ubuntu
