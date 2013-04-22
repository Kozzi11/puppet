#!/usr/bin/perl

#####################################################################
#                                                                   #
#    Author: Daniel Kozak                                           #
#    Description: CGI script - print some basic system information  #
#                                                                   #
#####################################################################

use strict;

use File::Basename;
use lib dirname( __FILE__ ); # set correct @INC
use HTML::Entities;
use CGI;
use SysInfo;

my $cgi = new CGI;
my $uptime = SysInfo::getUptime();
my @users = SysInfo::getLoggedUsers(); 
my $cpuCores = SysInfo::getCpuCores();
my @procs = SysInfo::getProcesses();
my @openFiles = SysInfo::getOpenFiles();

my $procsCount = @procs;
my $usersCount = @users;
my $openFilesCount = @openFiles;
my $usersHtml = '';

unshift(@users, 'Login');

sub renderTable($@) {
	my($title, @cells) = @_;
	
	print $cgi->h2($title);
	print $cgi->start_table({border => "1"});

	my $index = 0;
	foreach (@cells) {
		my $encode = encode_entities($_);
		print $cgi->Tr($index++ == 0 ? $cgi->th($encode) : $cgi->td($encode));
	} 

	print $cgi->end_table;
}

print $cgi->header("text/html");
print $cgi->start_html("System information");
print $cgi->h1("System information");
print $cgi->h2("Summary information");
print $cgi->table(
	{border => "1"},
	$cgi->Tr(
		$cgi->td($cgi->strong("Uptime")),
		$cgi->td($uptime)
	),
	$cgi->Tr(
		$cgi->td($cgi->strong("Cpu cores")),
		$cgi->td($cpuCores)
	),
	$cgi->Tr(
		$cgi->td($cgi->strong("Logged users count")),
		$cgi->td($usersCount)
	),
	$cgi->Tr(
		$cgi->td($cgi->strong("Processes count")),
		$cgi->td($procsCount)
	),
	$cgi->Tr(
		$cgi->td($cgi->strong("Open files count")),
		$cgi->td($openFilesCount)
	),
);

renderTable("Logged user login list", @users);
renderTable("Processes list", @procs);
renderTable("Open files list", @openFiles);

print $cgi->end_html;
