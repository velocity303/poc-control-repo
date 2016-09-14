#A class to install OHS from scratch
class ohs (
  $middleware_home = '/opt/oracle/middleware',
  $oracle_home = "${middleware_home}/ohs",
  $instance_home = "${oracle_home}/instances/instance1",
  $static_port_ini_file = '/opt/sw/prd_middleware/StaticPorts/staticports.ini',
){
  file { '/opt/sw/prd_middleware/OHS/11g/11_1_1_9_0/OHS_ServerInstall.rsp':
    ensure  => present,
    content => template('ohs/ohs_serverinstall.rsp.erb'),
  }
  file { $middleware_home:
    ensure => present,
    owner  => 'oracle',
    group  => 'dba',
  }
  if $::install_ohs == 'true' {
    exec { 'install ohs':
      command    => '/opt/sw/prd_middleware/OHS/11g/11_1_1_9_0/Disk1/runInstaller -silent -responseFile /opt/sw/prd_middleware/OHS/11g/11_1_1_9_0/OHS_ServerInstall.rsp -force 2>&1 | tee -a /var/schneider/logs/Middleware/ohs_install.log',
      path       => ['/bin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
      timeout    => 0,
      require    => File[$middleware_home],
      #  creates => $oracle_home,
    }
  }
}
