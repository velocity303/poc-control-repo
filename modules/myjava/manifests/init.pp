class myjava (
  $version = '1.8.0_65',
  $source = "/var/tmp/jdk${version}.tar.gz",
){

  file { [ '/opt/oracle', '/opt/oracle/java' ] :
    ensure => directory,
    mode   => '0777',
  }
  if $::java_ver != $version {
    exec { 'remove_incorrect_java':
      command => '/bin/rm -rf /opt/oracle/java/*',
      notify  => Staging::Deploy["jdk${version}.tar.gz"],
      path    => ['/bin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
    }
  }
  staging::deploy { "jdk${version}.tar.gz":
    source  => $source,
    target  => '/opt/oracle/java',
    strip   => 1,
    creates => '/opt/oracle/java/bin',
  }

}
