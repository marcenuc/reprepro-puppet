# == Type: reprepro::repository
#
# Configures a reprepro repository.
#
# === Parameters
#
# [*codenames*]
#   Ubuntu codenames to put in reprepro configuration. Default: ["precise"].
#
# === Variables
#
# [*reprepro::root*]
#   Base folder.
#
# === Examples
#
#  reprepro::repository { repowner:
#    codenames => [ 'natty', 'oneiric', 'precise' ]
#  }
#
# === Authors
#
# Marcello Nuccio <marcello.nuccio@gmail.com>
#
# === Copyright
#
# Copyright 2012 Marcello Nuccio, unless otherwise noted.
#
define reprepro::repository(
  $codenames = ['precise']
) {

  include reprepro

  $base = "$reprepro::root/$title"
  $conf = "$base/conf"

  File {
    owner => $title,
    group => $title,
  }

  file { $base:
    ensure => directory,
    require => File[$reprepro::root],
  }

  file { $conf:
    ensure  => directory,
    require => File[$base],
  }

  file { "$conf/distributions":
    ensure  => file,
    require => File[$conf],
    content => template('reprepro/distributions.erb'),
  }

  file { "$conf/options":
    ensure  => file,
    require => File[$conf],
    content => template('reprepro/options.erb'),
  }
}
