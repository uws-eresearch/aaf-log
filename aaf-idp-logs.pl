#!/usr/bin/perl
# Alf 20141217 initial processing 
# Alf 20150114 complete year and service hostname clumping

use Data::Dumper;

open( IN, "<./idp-audit-2014.txt" ) or die("$!");

my %datahash, %allhosts, %hostmapping;

# $hostmapping{"caudit.unisa.edu.au"} = "caudit";
# $hostmapping{"acclaim.edu.au"} = "acclaim";
# $hostmapping{"researchdata.ands.org.au"} = "rda";
# $hostmapping{"www.caudit.edu.au"} = "caudit";
# $hostmapping{"portal.aurin.org.au"} = "aurin";
# $hostmapping{"staging.aurin.org.au"} = "aurin";
$hostmapping{"keystone.rc.nectar.org.au"} = "nectar";
$hostmapping{"support.rc.nectar.org.au"} = "nectar";
$hostmapping{"sdauth.sciencedirect.com"} = "sciencedirect";
$hostmapping{"cloudstor.aarnet.edu.au"} = "cloudstor";

while( <IN> ) {
	($date, $d, $d, $url) = split( /\|/, $_ );
	($d, $d, $year, $month) = split( /\-/, $date );
	# my $ym = "$year,$month"; # print both year and month
	my $ym = "$month"; # just do it for months
	($d, $d, $hostname) = split( /\//, $url );
	if ($hostname ne "") {
		if (exists $hostmapping{$hostname}) {
			$hostname = $hostmapping{$hostname};
		} else {
	#		$hostname = "other"; # comment this line to see all hostnames
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

# print row for each year,month
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

#	foreach my $hostname (sort keys %{ $datahash{$ym} } )  {
#		print "$ym,$hostname,$datahash{$ym}{$hostname}\n";
#	}	
}
