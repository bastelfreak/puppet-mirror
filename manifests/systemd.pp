class mirror::systemd (
  $userhome = $mirror::userhome,
) {
  ['mirror_all', 'mirror_distributions', 'mirror_everything_else'].each |$script| {
    file{"${userhome}/scripts/${script}":
      ensure  => 'link',
      source  => "${userhome}/scripts/sync.sh",
      require => [File['mirror@.service'], File['mirror@.timer']]
    }
    service{"mirror@${script}.service":
      ensure  => 'stopped',
      enable  => true,
      require => File['mirror@.service'],
    }
    service{"mirror@${script}.timer":
      ensure  => 'running',
      enable  => true,
      require => File['mirror@.timer'],
    }
  }

  file{'mirror@.service':
    ensure => 'file',
    path   => '/etc/systemd/system/mirror@.service',
    source => 'puppet:///modules/mirror/systemd/mirror@.service',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  } ~> Exec['systemctl-daemon-reload']
  file{'mirror@.timer':
    ensure => 'file',
    path   => '/etc/systemd/system/mirror@.timer',
    source => 'puppet:///modules/mirror/systemd/mirror@.service',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  } ~> Exec['systemctl-daemon-reload']
}
