#!/bin/bash
mkdir -p /home/mirror/sync/tmp/repoforge
chown mirror:mirror /home/mirror/sync/tmp/repoforge
rsync -rptlvog --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/repoforge/ --delay-updates rsync://mirror1.hs-esslingen.de/repoforge /home/mirror/sync/repoforge
