#!perl
use strict;
use warnings;

sub p1 {
    my $n = shift;

    my $sum = 0;
    my $i = 1;

    while ($i < $n) {
        $sum += $i if $i % 3 == 0 || $i % 5 == 0;
        $i++;
    }

    return $sum;
}

my $limit = shift || 1000;
print p1($limit), "\n";
