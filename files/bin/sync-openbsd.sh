#!/bin/bash
mkdir -p /home/mirror/sync/tmp/openbsd
chown mirror:mirror /home/mirror/sync/tmp/openbsd
rsync -rptlvog --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/openbsd --delay-updates rsync://ftp.halifax.rwth-aachen.de/openbsd/ /home/mirror/sync/openbsd
