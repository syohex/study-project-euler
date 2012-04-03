#!perl
use strict;
use warnings;

use List::Util qw/reduce/;

# Please download name.txt from http://projecteuler.net/project/names.txt

sub p22 {
    my $file = shift;

    open my $fh, '<', $file or die "Can't open $file";

    my @words;
    while (my $line = <$fh>) {
        chomp $line;
        push @words, map { s{"}{}g ; $_ } split(/,/, $line);
    }
    close $fh;

    my @sorted = sort @words;

    my %values;
    my $sum = 0;
    my $index = 1;
    map {
        $sum += (each_word_value($_) * $index);
        $index++;
    } @sorted;

    return $sum;
}

sub each_word_value {
    my $word = shift;

    my @each_vals = map { ord($_) - ord('A') + 1 } split //, $word;
    {
        no warnings 'once';     # for flymake
        return reduce { $a + $b } @each_vals;
    }
}

my $file = "names.txt";
printf "p22() = %d\n", p22($file);
