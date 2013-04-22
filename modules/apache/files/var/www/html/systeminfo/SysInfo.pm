package SysInfo;
sub getUptime() {
	return `uptime`;
}

sub getCpuCores() {
	my $count = `grep "core id" /proc/cpuinfo | uniq | wc -l`;
	return $count == 0 ? 1 : $count;
}

sub getLoggedUsers() {
	return split('\n', `who | cut -d' ' -f1 | sort | uniq`);
}

sub getProcesses() {
	my @result;
	my @procsLines = split('\n', `ps aux`);
	foreach $line (@procsLines) {
		my @lineArray = split(/\s+/, $line, 11);
		push(@result, [@lineArray]);
	}

	return @result;
}

sub getOpenFiles() {
	my @result;
	my @filesLines = split('\n', `lsof`);
	foreach $line (@filesLines) {
		my @lineArray = split(/\s+/, $line, 7);
		push(@result, [@lineArray]);
	}

	return @result;
}

1;
