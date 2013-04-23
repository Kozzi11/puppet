Puppet
======

Puppet configuration for one client(node with RedHat base distro) with hostname(FQDN) node1.kozzi.eu.

Configuration contains these modules:
apache
-----
This module install and setup Apache web server with perl_mod for basic
CGI script.

sysinfo
------
CGI script for display html page with some system information

CGI script is installed into /var/www/html/systeminfo and script
result is available under URL: http://node1.kozzi.eu/systeminfo/

iptables
-------
Ensure that iptables is installed and contain rules for allowing http and ssh port 

sshd
----
Install and setup openssh-server for remote access, disable root login for security reasons

createuser
---------
Add user with username: kozak and password: polda11 (for remote ssh access)

selinux
------
switch selinux to permissive mode, when enforcing mode is active, some information in systeminfo CGI script are missing

Install and run
=============

Master
-----

    yum install http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm
    yum install puppet-server puppet git
    cd /etc/puppet/
    rm -rf *
    git clone git://github.com/Kozzi11/puppet.git .
    chkconfig --level 2345 puppetmaster on
    service puppetmaster start

and allow 8140 tcp port on firewall

Client 
-----
    yum install http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm
    yum install puppet
    puppet agent --server=master.kozzi.eu --no-daemonize --verbose

After first client connect it is neede to sign certificate

    puppet cert --sign node1.kozzi.eu
    










