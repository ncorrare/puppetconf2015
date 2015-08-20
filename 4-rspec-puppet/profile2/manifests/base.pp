class profile::base {
  file { '/home/ncorrare':
    ensure => directory,
    owner  => 'ncorrare',
    group  => 'wheel',
  }

  group { 'wheel':
    ensure => present,
  }

  user { 'ncorrare':
    ensure     => present,
    gid        => ['wheel'],
    managehome => true,
    require    => Group['wheel'],
  }

  file {'/etc/issue.net':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/profile/issue.net',
  }

  package { 'mtr':
    ensure => latest,
  }

  service { 'sshd':
    ensure => running,
    enable => 'true',
  }

}
