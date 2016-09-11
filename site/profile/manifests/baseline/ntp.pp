class profile::baseline::ntp {
  case $virtual {
    'physical': { include profile::baseline::ntp::blade }
    'vmware':   { include profile::baseline::ntp::vm }
  }
}
