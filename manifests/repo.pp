# == Class: flash::repo
#
# This class is considered private.
#
class flash::repo {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  rpmkey { '5FF054BD':
    ensure => present,
    source => 'https://swdl.flash.com/repos/flash/bjn-key',
  } ->
  yumrepo { 'flash':
    ensure   => 'present',
    baseurl  => 'https://swdl.flash.com/repos/flash/x86_64/release/rpm',
    descr    => 'Blue Jeans Network, Inc. - x86_64 software and updates',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'https://swdl.flash.com/repos/flash/bjn-key',
  }
}
