class createuser {

    package { "ruby-shadow" :
        ensure => present,
    }

    user { "kozak":
        ensure     => "present",
	managehome => true,
        password => '$6$JjC9LA27$8.8iLnwfvW3nBzY5T5eKKJn7oRA6jqApmxMlNygbl66XOqCt4ra865DzbexRW.T/gJCjRO0979RDlR0snZtLh/',
        require => Package["ruby-shadow"],
    }
}

