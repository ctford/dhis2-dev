class postgres {

  package { "postgresql":
    ensure => present,
  }

  service { "postgresql":
    require => Package["postgresql"],
    ensure => running,
    subscribe => File["pg_hba.conf"],
  }

  file { "pg_hba.conf" :
      require => Package["postgresql"],
      path => "/etc/postgresql/9.1/main/pg_hba.conf",
      ensure => file,
      owner => postgres,
      group => postgres,
      mode => 664,
      replace => true,
      content => template("postgres/pg_hba.conf.erb"),
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
