File { backup => false }

Package {
  allow_virtual => true,
}

Firewall {
  before  => Class['profile::firewall::post'],
  require => Class['profile::firewall::pre'],
}

class { ['profile::firewall::pre', 'profile::firewall::post']: }

resources { 'firewall':
  purge => true,
}

include firewall

node default {
  if !empty( $trusted['extensions']['pp_role'] ) {
    include "role::${trusted['extensions']['pp_role']}"
  }
}
if hiera('is_pe') == 'false'{
  hiera_include('classes')
}
