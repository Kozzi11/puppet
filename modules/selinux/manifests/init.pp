class selinux {
    package { "setroubleshoot" :
        ensure => present,
    }

    file { "/etc/selinux/config":
        owner => "root",
        group => "root",
        mode => 0644,
        source => "puppet://$puppetserver/modules/selinux/etc/selinux/config",
    }
}

