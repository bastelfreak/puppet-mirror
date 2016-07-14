class mirror::files (
  $sync_scripts = $mirror::sync_scripts,
  $userhome     = $mirror::userhome,
  $username     = $mirror::username,
  $groupname    = $mirror::groupname,
) {
  $sync_scripts.each |$script| {
    file{$script:
      ensure => 'file',
      source => "puppet:///modules/mirror/bin/${script}",
      path   => "${userhome}/scripts/${script}",
      owner  => $username,
      group  => $groupname,
      mode   => '0755',
    }
  }
}
