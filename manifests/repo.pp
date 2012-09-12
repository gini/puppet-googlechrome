# == Class: googlechrome::repo
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class googlechrome::repo(
  $repo_name,
  $baseurl,
  $key,
  $key_source,
  $repos,
  $release,
  $pin,
  $gpgcheck,
  $enabled,
) {
  case $::osfamily {
    'Debian': {
      class { 'googlechrome::repo::debian':
        repo_name  => $repo_name,
        baseurl    => $baseurl,
        release    => $release,
        repos      => $repos,
        key        => $key,
        key_source => $key_source,
        pin        => $pin,
      }
    }
    'RedHat': {
      class { 'googlechrome::repo::redhat':
        repo_name => $repo_name,
        baseurl   => $baseurl,
        gpgkey    => $key_source,
        gpgcheck  => $gpgcheck,
        enabled   => $enabled,
      }
    }
    default:  { fail("${::osfamily} is not supported by ${module_name}") }
  }
}
