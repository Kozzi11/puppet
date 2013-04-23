class sysinfo {

    package { "perl-HTML-Parser":
	ensure => present,
    }

    package { "perl-CGI":
        ensure => present,
    }

    file { "/var/www/html/systeminfo":
        ensure => "directory",
        owner => "apache",
        group => "apache",
	require => Class["apache"],
        mode => 0750,
    }

    file { "/var/www/html/systeminfo/index.pl":
        owner => "apache",
        group => "apache",
        mode => 0750,
        source => "puppet://$puppetserver/modules/sysinfo/var/www/html/systeminfo/index.pl",
        require => File["/var/www/html/systeminfo"],
    }
    
    file { "/var/www/html/systeminfo/SysInfo.pm":
        owner => "apache",
        group => "apache",
        mode => 0750,
        source => "puppet://$puppetserver/modules/sysinfo/var/www/html/systeminfo/SysInfo.pm",
        require => [File["/var/www/html/systeminfo"], Package["perl-HTML-Parser"], Package["perl-CGI"]],
    }
        
}

