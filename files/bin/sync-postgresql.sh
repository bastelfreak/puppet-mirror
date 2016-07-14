#!/bin/bash
mkdir -p /home/mirror/sync/tmp/postgresql
mkdir -p /home/mirror/sync/postgresql/pgsql-ftp
#mkdir -p /home/mirror/sync/postgresql/yum-repo
chown mirror:mirror /home/mirror/sync/tmp/postgresql
chown mirror:mirror /home/mirror/sync/postgresql/pgsql-ftp
#chown mirror:mirror /home/mirror/sync/postgresql/yum-repo

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlvog $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/postgresql/ --delay-updates rsync://apt.postgresql.org/pgsql-ftp /home/mirror/sync/postgresql/pgsql-ftp
#rsync -rptlvog --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/postgresql/ --delay-updates rsync://yum.postgresql.org/yum-repo /home/mirror/sync/postgresql/yum-repo

