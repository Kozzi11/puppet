class iptables {
    package { "iptables" :
        ensure => present,
    }

    service { "iptables":
        ensure => "running",
        enable => true,
        require => Package["iptables"],
    }

    file { "/etc/sysconfig/iptables":
        notify  => Service["iptables"],  # this sets up the relationship
        owner => "root",
        group => "root",
        mode => 0600,
        source => "puppet://$puppetserver/modules/iptables/etc/sysconfig/iptables",
        require => Package["iptables"],
    }
}

