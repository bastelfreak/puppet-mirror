class mirror (
  $sync_scripts = $mirror::params::sync_scripts,
) inherits mirror::params {

  validate_array($sync_scripts)

  group{'mirror':
    gid => 1000,
  } ->
  user{'mirror':
    ensure     => 'present',
    managehome => true,
    home       => '/home/mirror',
    shell      => '/bin/bash',
    uid        => 1000,
    gid        => 1000,
  }
  $sync_scripts.each |$script| {
    file{$script:
      ensure => 'file',
      source => "puppet:///modules/mirror/bin/${script}",
      path   => "/home/mirror/scripts/${script}",
      owner  => 'mirror',
      group  => 'mirror',
      mode   => '0755',
    }
  }
  ['mirror_all', 'mirror_distributions', 'mirror_everything_else'].each |$alias| {
    file{"/home/mirror/scripts/${alias}":
      ensure => 'link',
      source => '/home/mirror/scripts/sync.sh',
    }
  }
}
