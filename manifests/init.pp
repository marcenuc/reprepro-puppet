# == Class: reprepro
#
# Installs reprepro package.
#
# === Parameters
#
# [*root*]
#   Specify base folder name for the repository. Default: "/srv/reprepro".
#
# === Variables
#
# None.
#
# === Examples
#
#  class { reprepro: }
#
# === Authors
#
# Marcello Nuccio <marcello.nuccio@gmail.com>
#
# === Copyright
#
# Copyright 2012 Marcello Nuccio, unless otherwise noted.
#
class reprepro(
  $root = '/srv/reprepro'
) {

  package { 'reprepro':
    ensure => latest,
  }

  file { $root:
    ensure => directory,
  }
}
