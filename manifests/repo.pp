# == Class: flash::repo
#
# This class is considered private.
#
class flash::repo {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  $package_name = 'adobe-release-x86_64-1.0-1.noarch'
  $key = '/etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux'

  package { $package_name:
    ensure   => present,
    source   => "http://linuxdownload.adobe.com/adobe-release/${package_name}.rpm",
    provider => rpm,
  } ->
  rpmkey { 'F6777C67':
    ensure => present,
    source => $key,
  } ->
  yumrepo { 'adobe-linux-x86_64':
    ensure   => 'present',
    baseurl  => 'http://linuxdownload.adobe.com/linux/x86_64/',
    descr    => 'Adobe Systems Incorporated',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => "file://${key}",
  }
}
