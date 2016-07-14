class mirror::user (
  $username  = $mirror::username,
  $groupname = $mirror::groupname,
  $userhome  = $mirror::userhome,
  $usershell = $mirror::usershell,
  $gid       = $mirror::gid,
  $uid       = $mirror::uid,
) {
  group{$groupname:
    gid => $gid,
  } ->
  user{$username:
    ensure     => 'present',
    managehome => true,
    home       => $userhome,
    shell      => $usershell,
    uid        => $uid,
    gid        => $gid,
  }
}
