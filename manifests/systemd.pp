class mirror::systemd (
  $userhome = $mirror::userhome,
) {
  ['mirror_all', 'mirror_distributions', 'mirror_everything_else'].each |$alias| {
    file{"${userhome}/scripts/${alias}":
      ensure => 'link',
      source => '/home/mirror/scripts/sync.sh',
    }
  }
}
