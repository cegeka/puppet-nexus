class nexus::package(
  $version = undef,
  $versionlock = false
) {

  validate_re($version, '^[~+._0-9a-zA-Z:-]+$')
  validate_bool($versionlock)

  package { 'nexus':
    ensure => $version,
  }

  case $versionlock {
    true: {
      packagelock { 'nexus': }
    }
    false: {
      packagelock { 'nexus': ensure => absent }
    }
    default: { fail('Class[Nexus]: parameter versionlock must be true or false') }
  }

}
