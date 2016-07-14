#!/bin/bash
# this sync yum.puppetlabs aaaand apt.puppetlabs
# proper naming FTW!
mkdir -p /home/mirror/sync/tmp/puppet

quiet="";
if ! stty &>/dev/null; then
  quiet="--quiet"
fi
rsync -rptlv -o -g $quiet --chown=mirror:mirror --delete-after --safe-links --info=progress2  --temp-dir=/home/mirror/sync/tmp/puppet/ --delay-updates rsync://yum.puppetlabs.com/packages /home/mirror/sync/puppet
