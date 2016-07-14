class mirror (
  $sync_scripts = $mirror::params::sync_scripts,
  $username     = $mirror::params::username,
  $groupname    = $mirror::params::groupname,
  $userhome     = $mirror::params::userhome,
  $usershell    = $mirror::params::usershell,
  $gid          = $mirror::params::gid,
  $uid          = $mirror::params::uid,
) inherits mirror::params {

  validate_array($sync_scripts)
  validate_integer($gid)
  validate_integer($uid)

  class {'::mirror::user': } ->
  class {'::mirror::files': } ->
  class {'::mirror::systemd': }
}
