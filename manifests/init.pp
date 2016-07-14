# base class to deploy a mirror for a bunch of stuff
class mirror (
  $sync_scripts = [],
  ) {

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
  } ->
  file{'sync-scripts':
    ensure  => 'directory',
    source  => 'puppet:///modules/mirror/bin',
    path    => '/home/mirror/scripts',
    purge   => false,
    recurse => true,
  }
  ['mirror_all', 'mirror_distributions', 'mirror_everything_else'].each |$script| {
    file{"/home/mirror/scripts/${script}":
      ensure  => 'link',
      source  => '/home/mirror/scripts/sync.sh',
      require => File['sync-scripts'],
    }
  }
}
