#A class to install OHS from scratch
class ohs (
  $oracle_home = '/opt/oracle/middleware/ohs',
  $middleware_home = '/opt/oracle/middleware',
  $instance_home = '/opt/oracle/middleware/ohs/instances/instance1',
  $static_port_ini_file = '/opt/sw/prd_middleware/StaticPorts/staticports.ini',
){
  file { '/opt/sw/prd_middleware/OHS/11g/11_1_1_9_0/OHS_ServerInstall.rsp':
    ensure  => present,
    content => template('ohs/ohs_serverinstall.rsp.erb'),
  }
  if $::install_ohs == 'true' {
    exec { 'install ohs':
      command => '/opt/sw/prd_middleware/OHS/11g/11_1_1_9_0/Disk1/runInstaller -silent -responseFile /opt/sw/prd_middleware/OHS/11g/11_1_1_9_0/OHS_ServerInstall.rsp -force 2>&1 | tee -a /var/schneider/logs/Middleware/ohs_install.log',
      path    => ['/bin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
      #  creates => $oracle_home,
    }
  }
}
