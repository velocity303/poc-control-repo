#There are two ways to manage this installation - either by going through with the default puppetlabs/java module or alternatively deploying it manually from a remote host.
class profile::java {
  #java::oracle { 'jdk8' :
  #  ensure  => 'present',
  #  version => '8',
  #  java_se => 'jdk',
  #}
  include myjava
}
