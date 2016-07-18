class mirror::systemd (
  $userhome  = $mirror::userhome,
  $username  = $mirror::username,
  $groupname = $mirror::groupname,
) {
  ['mirror_all', 'mirror_distributions', 'mirror_everything_else'].each |$script| {
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
    ensure  => 'file',
    path    => '/etc/systemd/system/mirror@.service',
    content => template('mirror/systemd/mirror@.service.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  } ~> Exec['systemctl-daemon-reload']
  file{'mirror@.timer':
    ensure  => 'file',
    path    => '/etc/systemd/system/mirror@.timer',
    content => template('mirror/systemd/mirror@.service.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  } ~> Exec['systemctl-daemon-reload']
}
