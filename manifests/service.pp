class nexus::service(
  $ensure = 'running'
){

  validate_re($ensure, '^running$|^stopped$')

  service { 'nexus':
    ensure     => $ensure,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }

}
