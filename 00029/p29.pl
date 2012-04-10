#!perl
use strict;
use warnings;

use Math::BigInt;

sub p29 {
    my ($a_limit, $b_limit) = @_;

    my %powered;
    for my $a (2..$a_limit) {
        my $big_a = Math::BigInt->new($a);
        $big_a->bround(200);
        for my $b (2..$b_limit) {
            my $big_b = Math::BigInt->new($b);
            $big_b->bround(200);
            my $key = $big_a ** $big_b;
            $powered{$key}++;
        }
    }

    return scalar keys %powered;
}

printf "p29() = %d\n", p29(100, 100);
