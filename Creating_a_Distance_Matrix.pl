#!/usr/bin/perl

use strict;
use warnings;

my $f_in = shift;


my %hs_seqs = ();
my @ar_seqids = ();
my $id = "";
open(F,"$f_in");
while(<F>){
	chomp;
	if ($_ =~ /^>(.+)/){
		$id = $1;
		push(@ar_seqids, $id);
	}else{
		$hs_seqs{$id} .= $_;
	}
}
close(F);

sub CalcDist {
my $seq1 = shift;
my $seq2 = shift;
my @ar_seq1 = split (//, $seq1);
my @ar_seq2 = split (//, $seq2);
my $cnt = 0;

for (my $i = 0 ; $i <= $#ar_seq1 ; $i++){
        if ($ar_seq1[$i] ne  $ar_seq2[$i]){
                $cnt ++;
        }

}
return $cnt;
}

my $length = length($hs_seqs{$ar_seqids[0]});
foreach my $seqid1 (@ar_seqids){
	foreach my $seqid2 (@ar_seqids){
		if ($seqid1 eq $seqid2){
			print "0\t";
		}else{
			my $dist = CalcDist($hs_seqs{$seqid1}, $hs_seqs{$seqid2});
			my $val = $dist/$length;
			printf "%.3f\t",$val;
		}
	}
	print "\n";
}
