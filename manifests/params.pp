class mirror::params {
  $sync_scripts = [
    'sync-archlinux.sh',
    'sync-autoinstall.plesk.com.sh',
    'sync-centos.sh',
    'sync-cpan.sh',
    'sync-cygwin.sh',
    'sync-debian.sh',
    'sync-dell.sh',
    'sync-elrepo.sh',
    'sync-epel.sh',
    'sync-fedora.sh',
    'sync-foreman.sh',
    'sync-freebsd.sh',
    'sync-gentoo.sh',
    'sync-hpe.sh',
    'sync-jenkins.sh',
    'sync-openbsd.sh',
    'sync-postgresql.sh',
    'sync-puppet.sh',
    'sync-repoforge.sh',
    'sync.sh',
    'sync-ubuntu.sh',
    'sync-zabbix.sh',
  ]
  $username = 'mirror'
  $groupname = 'mirror'
  $userhome = '/home/mirror'
  $usershell = '/bin/bash'
  $gid = 1000
  $uid = 1000
}
