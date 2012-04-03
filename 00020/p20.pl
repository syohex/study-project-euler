#!perl
use strict;
use warnings;

use bigint;
use List::Util qw/reduce/;

sub p20 {
    my $num = shift;

    my $sum = 1;
    $sum *= $_ for 1..$num;

    my @digits = split //, $sum;

    my $digits_sum;
    {
        no warnings 'once'; # for flymake
        $digits_sum = reduce { $a + $b } @digits;
    }

    return $digits_sum;
}

printf "p(10) = %d\n", p20(10);
printf "p(100) = %d\n", p20(100);
