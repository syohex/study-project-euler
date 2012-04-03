#!perl
use strict;
use warnings;

use List::Util qw/reduce/;

sub p21 {
    my $num = shift;

    my %divisor;
    for my $i (2..$num) {
        my $sum = 0;
        for my $j (1..($i-1)) {
            $sum += $j if $i % $j == 0;
        }
        $divisor{$i} = $sum;
    }

    my %amicable_number;
    for my $key (keys %divisor) {
        my $value = $divisor{$key};
        if (exists $divisor{$value}
                && ($key != $value)
                && $divisor{ $value } == $key) {
            $amicable_number{$key} = 1;
        }
    }

    my $sum;
    {
        no warnings 'once'; # for flymake
        $sum = reduce { $a + $b } keys %amicable_number;
    }

    return $sum;
}
printf "p21(10000) = %d\n", p21(10000);
