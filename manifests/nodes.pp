node 'node1.kozzi.eu' {
    include apache
    include sysinfo
    include sshd
    include iptables
    include selinux
    include createuser
}
