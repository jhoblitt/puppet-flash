# == Class: flash
#
class flash(
  $manage_repo = $::flash::params::manage_repo,
) inherits flash::params {

  if $manage_repo {
    require flash::repo
    Class[flash::repo] -> Package[$::flash::params::package_name]
  }

  package { $::flash::params::package_name:
    ensure => present,
  }
}
