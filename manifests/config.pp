class nexus::config(
){

  file { '/opt/nexus/bin/nexus':
    ensure => file,
    owner  => 'nexus',
    group  => 'nexus',
    source => "puppet:///modules/${module_name}/bin/nexus"
  }

  file { '/opt/nexus/conf/nexus.properties':
    ensure  => file,
    mode    => '0644',
    owner   => 'nexus',
    group   => 'nexus',
    content => template("${module_name}/conf/nexus.properties.erb")
  }

  file { '/opt/nexus/conf/jetty.xml':
    ensure  => file,
    mode    => '0644',
    owner   => 'nexus',
    group   => 'nexus',
    content => template("${module_name}/conf/jetty.xml.erb")
  }

}
