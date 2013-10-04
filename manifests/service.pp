class nexus::service {

  service { 'nexus':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }

}
