exec { "pre-install-update":
	command => "/usr/bin/apt-get update"
}

exec { "install-add-apt":
	command => "/usr/bin/apt-get install python-software-properties -y",
	creates => '/usr/bin/add-apt-repository'
}

exec { "add-apt-repository":
	command => "/usr/bin/add-apt-repository -y ppa:webupd8team/java"
}

exec { "apt-update":
    command => "/usr/bin/apt-get update",
    subscribe => Exec["add-apt-repository"],
    refreshonly => true
}

Exec["pre-install-update"] -> Exec["install-add-apt"] -> Exec["add-apt-repository"] -> Exec["apt-update"] -> Package <| |>

include curl
include openjdk7
include postgres
include tomcat7
include dhis2
