#!/usr/bin/perl
# Alf 20141217 initial processing 
# Alf 20150114 complete year and service hostname clumping

use Data::Dumper;

open( IN, "<./idp-audit-2014.txt" ) or die("$!");

my %datahash, %allhosts, %hostmap;

# map AAF SP hostnames into something generically friendly
$hostmap{"caudit.unisa.edu.au"} = "caudit";
$hostmap{"acclaim.edu.au"} = "acclaim";
$hostmap{"researchdata.ands.org.au"} = "rda";
$hostmap{"www.caudit.edu.au"} = "caudit";
$hostmap{"portal.aurin.org.au"} = "aurin";
$hostmap{"staging.aurin.org.au"} = "aurin";
$hostmap{"keystone.rc.nectar.org.au"} = "nectar";
$hostmap{"support.rc.nectar.org.au"} = "nectar";
$hostmap{"sdauth.sciencedirect.com"} = "sciencedirect";
$hostmap{"cloudstor.aarnet.edu.au"} = "cloudstor";

while( <IN> ) {
	($date, $d, $d, $url) = split( /\|/, $_ );
	($d, $d, $year, $month) = split( /\-/, $date );
	# my $ym = "$year,$month"; # print both year and month
	my $ym = "$month"; # just do it for months
	($d, $d, $hostname) = split( /\//, $url );
	
	if ($hostname ne "") {
		if (exists $hostmap{$hostname}) {
			$hostname = $hostmap{$hostname};
		} else {
#			$hostname = "other"; # uncomment this line to see all hostnames
		}
		$datahash{$ym}{$hostname}++;
		$allhosts{$hostname}++;
	}
}
close( IN );

# print CSV header row
	print "mon";
foreach my $host (sort keys %allhosts) {
	print ",$host";
}
	print "\n";

# print a row for each year,month
foreach my $ym (sort keys %datahash) {
	print "$ym";
	
	foreach my $host (sort keys %allhosts) {
		if ($datahash{$ym}{$host} > 0) {
			print ",$datahash{$ym}{$host}";
		} else {
			print ",0"; # no hits for that host in this month
		}
	}
	print "\n";
}
