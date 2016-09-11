class profile::baseline::ntp::blade {
  user { 'ntp':
    ensure => present,
  }
  group { 'ntp':
    ensure => present,
  }
  file { ['/var/ntp', '/var/ntp/ntpstats']:
    ensure => directory,
    owner  => 'ntp',
    group  => 'ntp',
  }
  class { '::ntp':
    servers         => ['CBCtimesrv1','CBCtimesrv2','127.127.1.0'],
    restrict        => ['default ignore', '127.0.0.1', '161.222.1.35', '161.222.2.30', '127.127.1.0'],
    fudge           => ['127.127.1.0 stratum 3'],
    driftfile       => '/var/ntp/ntp.drift',
    config_template => 'data/custom_ntp.conf.erb',
    require         => File['/var/ntp/ntpstats'],
  }
}
