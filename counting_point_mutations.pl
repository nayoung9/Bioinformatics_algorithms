#!/usr/bin/perl

use strict;
use warnings;

my $seq1 = <STDIN>;
my $seq2 = <STDIN>;

chomp $seq1 ;
chomp $seq2 ;

my @ar_seq1 = split (//, $seq1);
my @ar_seq2 = split (//, $seq2);
my $cnt = 0;

for (my $i = 0 ; $i <= $#ar_seq1 ; $i++){
        if ($ar_seq1[$i] ne  $ar_seq2[$i]){
                $cnt ++;
        }

}

print $cnt . "\n" ;
