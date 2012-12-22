# == Class: googlechrome::params
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class googlechrome::params {
  $repo_name = $::googlechrome_repo_name ? {
    undef   => 'google-chrome',
    default => $::googlechrome_repo_name
  }

  $repo_baseurl = $::googlechrome_repo_baseurl ? {
    undef   => $::osfamily ? {
      'RedHat' => "http://dl.google.com/linux/chrome/rpm/stable/${::architecture}",
      'Debian' => 'http://dl.google.com/linux/chrome/deb',
      default  => fail("${::osfamily} is not supported by ${module_name}")
    },
    default => $::googlechrome_repo_baseurl
  }

  $repo_key = $::googlechrome_repo_key ? {
    undef   => '7FAC5991',
    default => $::googlechrome_repo_key
  }

  $repo_key_source = $::googlechrome_repo_key_source ? {
    undef   => $::osfamily ? {
      /(RedHat|Debian)/ => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
      default           => fail("${::osfamily} is not supported by ${module_name}")
    },
    default => $::googlechrome_repo_key_source
  }

  $repo_repos = $::googlechrome_repo_repos ? {
    undef   => 'main',
    default => $::googlechrome_repo_release
  }

  $repo_release = $::googlechrome_repo_release ? {
    undef   => 'stable',
    default => $::googlechrome_repo_release
  }

  $repo_pin = $::googlechrome_repo_pin ? {
    undef   => 200,
    default => $::googlechrome_repo_pin
  }

  $repo_gpgcheck = $::googlechrome_repo_gpgcheck ? {
    undef   => 1,
    default => $::googlechrome_repo_gpgcheck
  }

  $repo_enabled = $::googlechrome_repo_enabled ? {
    undef   => 1,
    default => $::googlechrome_repo_enabled
  }

  $package = $::googlechrome_package ? {
    undef   => 'google-chrome-stable',
    default => $::googlechrome_package
  }

  $version = $::googlechrome_version ? {
    undef   => 'installed',
    default => $::googlechrome_version
  }
}
