class nexus(
  $version = undef,
  $versionlock = false,
  $ensure = 'running',
  $nexus_host = '0.0.0.0',
  $nexus_port = '8080',
  $nexus_work_dir = '/data/nexus'
) {

  include stdlib

  anchor { 'nexus::begin': }
  anchor { 'nexus::end': }

  validate_re($version, '^[~+._0-9a-zA-Z:-]+$')
  validate_bool($versionlock)
  validate_re($ensure, '^running$|^stopped$')

  class { 'nexus::package':
    version     => $version,
    versionlock => $versionlock
  }

  class { 'nexus::config': }

  class { 'nexus::service':
    ensure => $ensure
  }

  Anchor['nexus::begin'] -> Class['Nexus::Package'] -> Class['Nexus::Config'] -> Class['Nexus::Service'] -> Anchor['nexus::end']

}
