class sshd {
    package {
        "openssh-server" : ensure => present, 
    }

    service { "sshd":
        ensure => "running",
        enable => true,
        require => Package["openssh-server"],
    }

    file { "/etc/ssh/sshd_config":
        notify  => Service["sshd"],  # this sets up the relationship
        owner => "root",
        group => "root",
        mode => 0600,
        source => "puppet://$puppetserver/modules/apache/etc/ssh/sshd_config",
        require => Package["openssh-server"],
    }
}

