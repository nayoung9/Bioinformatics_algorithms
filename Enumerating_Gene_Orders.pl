#!/usr/bin/perl


use strict;
use warnings;

my $num = shift;

my @ar_in = ();

foreach my $this (1 .. $num){
	push (@ar_in,$this);
}
my $count = 0;
my $print = "";
perm("", @ar_in);
print $count."\n";
print $print."\n";

sub perm {
	my $Constant_addTo = shift;
	my @ar_get = @_;
	for (my $i = 0 ;$i <= $#ar_get; $i ++){
		my $addTo = $Constant_addTo;
		if ($#ar_get == 0) {last;}
		my @ar_new = @ar_get;
		$addTo .= $ar_get[$i]." ";
		splice(@ar_new,$i,1);
		if(scalar(@ar_new) == 1){	
			$print .=  "$addTo@ar_new \n";
			$count ++;
		}
		perm ($addTo,@ar_new);
	}
}
