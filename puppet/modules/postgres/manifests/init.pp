class postgres {

  package { "postgresql":
    ensure => present,
  }

  service { "postgresql":
    require => Package["postgresql"],
    ensure => running,
  }

  exec { "createuser":
    require => Service["postgresql"],
    command => "/usr/bin/sudo -u postgres -c \"/usr/bin/createuser -DRS dhis2\"",
#    refreshonly => true,
  }

  exec { "createdb":
    require => Exec["createuser"],
    require => Service["postgresql"],
    command => "/usr/bin/sudo -u postgres -c \"/usr/bin/createdb -O postgres dhis2\"",
#    refreshonly => true,
  }
}
