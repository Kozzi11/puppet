class apache {
    package {
        "httpd" : ensure => present, 
    }

    package { "mod_perl" :
        ensure => present,
        require => Package["httpd"],
    }
   
    service { "httpd":
        ensure => "running",
        enable => true,
        require => Package["httpd"],
    }
    
    file { "/etc/httpd/conf.d/perl.conf":
        owner => "root",
        group => "root",
        mode => 0644,
        source =>
        "puppet://$puppetserver/modules/apache/etc/httpd/conf.d/perl.conf",
        require => Package["mod_perl"],
    }
    
}

