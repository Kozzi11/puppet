class apache {
    package {
        "httpd" : ensure => present, 
    }

    package { "mod_perl" :
        ensure => present,
        require => Package["httpd"],
    }
   
    package { "setroubleshoot" :
        ensure => present,
    }

    service { "httpd":
        ensure => "running",
        enable => true,
        require => Package["httpd"],
    }

    file { "/etc/selinux/config":
        owner => "root",
        group => "root",
        mode => 0644,
        source => "puppet://$puppetserver/modules/apache/etc/selinux/config",
    }

    file { "/var/www/html/systeminfo":
        ensure => "directory",
        owner => "apache",
        group => "apache",
        mode => 0750,
    }

    file { "/var/www/html/systeminfo/index.pl":
        owner => "apache",
        group => "apache",
        mode => 0750,
        source => "puppet://$puppetserver/modules/apache/var/www/html/systeminfo/index.pl",
        require => File["/var/www/html/systeminfo"],
    }
    
    file { "/var/www/html/systeminfo/SysInfo.pm":
        owner => "apache",
        group => "apache",
        mode => 0750,
        source => "puppet://$puppetserver/modules/apache/var/www/html/systeminfo/SysInfo.pm",
        require => File["/var/www/html/systeminfo"],
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

