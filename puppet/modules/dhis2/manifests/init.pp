class dhis2 {
  package { "openjdk-7-jdk":
    ensure => present,
  }

#  exec { "jar":
#    command => "/usr/bin/wget http://apps.dhis2.org/ci/job/dhis-web-trunk/lastSuccessfulBuild/artifact/dhis-2/dhis-web/dhis-web-portal/target/dhis.war -o dhis.war",
#    refreshonly => true,
#  }
}
