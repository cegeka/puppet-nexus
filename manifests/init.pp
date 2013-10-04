class nexus {

  include nexus::package
  include nexus::service

  Class['Nexus::Package'] -> Class['Nexus::Service']

}
