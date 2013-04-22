puppet
======

Puppet configuration for one client(node) with hostname(FQDN) node1.kozzi.eu.

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









