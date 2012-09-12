# Class: nexus
#
# This module manages nexus
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class nexus {

  package { 'nexus':
    ensure => present,
  }

  service { 'nexus':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}
