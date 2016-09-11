class myjava (
  $version = '1.8.0_65',
  $source = "/var/tmp/jdk${version}.tar.gz",
){

  transition { 'clean up bad java version':
    resource   => File['/opt/oracle/java'],
    attributes => {
      ensure   => absent,
      recurse  => true,
      purge    => true,
    },
    prior_to   => Staging::Deploy["jdk${version}.tar.gz"],
  }

  file { '/opt/oracle/java':
    ensure => directory,
    mode   => '0777',
  }

  staging::deploy { "jdk${version}.tar.gz":
    source  => $source,
    target  => '/opt/oracle/java',
    strip   => 1,
    creates => '/opt/oracle/java/java',
  }

}
