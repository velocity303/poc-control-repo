#A class to install OHS from scratch
class ohs {
  file { '/opt/sw/prd_middleware/OHS/11g/11_1_1_9_0/OHS_ServerInstall.rsp':
    ensure  => present,
    content => template('ohs/ohs_serverinstall.rsp.erb'),
  }->
  exec { 'install ohs':
    command     => '/opt/sw/prd_middleware/OHS/11g/11_1_1_9_0/Disk1/runInstaller -silent -responseFile /opt/sw/prd_middleware/OHS/11g/11_1_1_9_0/OHS_ServerInstall.rsp -force 2>&1 | tee -a /var/schneider/logs/Middleware/ohs_install.log',
    path        => ['/bin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
    refreshonly => true,
  }
}
