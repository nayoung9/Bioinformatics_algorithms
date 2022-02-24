#!/usr/bin/perl

use strict;
use warnings;

my $codonT = shift;
my $f_in = shift;

my %hs_codon = ();
open(F,"$codonT");
while(<F>){
	chomp;
	my ($codon, $am) = split(/\t/,$_);
	$hs_codon{$am} ++;
}
close(F);

my $str;
open(F,"$f_in");
while(<F>){
	chomp;
	$str = $_;
}
close(F);

my @ar_str = split(//,$str);
my $return = 1;
my $min = 2147483647/4;
my $mod = 1;

push(@ar_str,"Stop");
my $all_cases = 1;
foreach my $am (@ar_str){
	$all_cases = $all_cases * $hs_codon{$am};
	 if ($all_cases > 1000000){
		$all_cases = $all_cases % 1000000;
	}
}
print $all_cases."\n";

