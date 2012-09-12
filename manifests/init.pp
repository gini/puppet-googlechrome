# == Class: googlechrome
#
# Install the Google Chrome browser from Google's official Linux repositories.
#
# Supported operating systems are:
#   - Fedora Linux
#   - Debian Linux
#   - Ubuntu Linux
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class googlechrome(
  $package         = 'UNSET',
  $version         = 'UNSET',
  $repo_name       = 'UNSET',
  $repo_baseurl    = 'UNSET',
  $repo_key        = 'UNSET',
  $repo_key_source = 'UNSET',
  $repo_gpgcheck   = 'UNSET',
  $repo_enabled    = 'UNSET',
  $repo_repos      = 'UNSET',
  $repo_release    = 'UNSET',
  $repo_pin        = 'UNSET',
) {

  include googlechrome::params

  $package_real = $package ? {
    'UNSET' => $::googlechrome::params::package,
    default => $package,
  }

  $version_real = $version ? {
    'UNSET' => $::googlechrome::params::version,
    default => $version,
  }

  $repo_name_real = $repo_name ? {
    'UNSET' => $::googlechrome::params::repo_name,
    default => $repo_name,
  }

  $repo_baseurl_real = $repo_baseurl ? {
    'UNSET' => $::googlechrome::params::repo_baseurl,
    default => $repo_baseurl,
  }

  $repo_key_real = $repo_key ? {
    'UNSET' => $::googlechrome::params::repo_key,
    default => $repo_key,
  }

  $repo_key_source_real = $repo_key_source ? {
    'UNSET' => $::googlechrome::params::repo_key_source,
    default => $repo_key_source,
  }

  $repo_repos_real = $repo_repos ? {
    'UNSET' => $::googlechrome::params::repo_repos,
    default => $repo_repos,
  }

  $repo_release_real = $repo_release ? {
    'UNSET' => $::googlechrome::params::repo_release,
    default => $repo_release,
  }

  $repo_pin_real = $repo_pin ? {
    'UNSET' => $::googlechrome::params::repo_pin,
    default => $repo_pin,
  }

  $repo_gpgcheck_real = $repo_gpgcheck ? {
    'UNSET' => $::googlechrome::params::repo_gpgcheck,
    default => $repo_gpgcheck,
  }
  $repo_enabled_real = $repo_enabled ? {
    'UNSET' => $::googlechrome::params::repo_enabled,
    default => $repo_enabled,
  }

  class { 'googlechrome::repo':
    $repo_name  = $repo_name_real,
    $baseurl    = $repo_baseurl_real,
    $key        = $repo_key_real,
    $key_source = $repo_key_source_real,
    $repos      = $repo_repos_real,
    $release    = $repo_release_real,
    $pin        = $repo_pin_real,
    $gpgcheck   = $repo_gpgcheck_real,
    $enabled    = $repo_enabled_real,
  }

  package { $package:
    ensure  => $version,
    require => Class['googlechrome::repo'],
  }
}
