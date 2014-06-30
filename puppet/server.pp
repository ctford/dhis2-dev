exec { "pre-install-update":
	command => "/usr/bin/apt-get update"
}

Exec["pre-install-update"] -> Package <| |>

include postgres
include dhis2
