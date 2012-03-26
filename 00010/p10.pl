#!perl
use strict;
use warnings;

sub p10 {
    my $limit = shift;

    my @nums = 2..$limit;

    for (my $i = 2; $i < $limit; $i++) {
        next unless defined $nums[$i];

        for (my $j = $i + $i; $j < $limit; $j += $i) {
            $nums[$j] = undef;
        }
    }

    my @primes = grep { defined $nums[$_] } 2..$limit;

    my $sum = 0;
    map { $sum += $_ } @primes;
    return $sum;
}

for my $i (10, 2_000_000) {
    printf "p10(%d) = %d\n", $i, p10($i);
}
