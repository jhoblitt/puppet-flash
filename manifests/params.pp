# == Class: flash::params
#
# This class is considered private.
#
class flash::params {

  case $::osfamily {
    'RedHat': {
      $manage_repo  = true
      $package_name = 'bjnplugin'
    }
    default: {
      fail("${::osfamily} is not supported")
    }
  }
}
