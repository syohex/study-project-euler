#!perl
use strict;
use warnings;

sub p2 {
    my $limit = shift || 4_000_000;

    my $fib = sub {
        my $n = shift;

        if ($n == 1) {
            return 1;
        } elsif ($n == 2) {
            return 2;
        } else {
            my $fib;
            my ($prev1, $prev2) = (1, 2);
            for (my $i = 3; $i <= $n; $i++) {
                $fib = $prev1 + $prev2;
                ($prev1, $prev2) = ($prev2, $fib);
            }
            return $fib;
        }
    };

    my $sum = 0;
    my $i = 1;
    while (1) {
        my $val = $fib->($i);
        last if $val >= $limit;

        $sum += $val if $val % 2 == 0;
        $i++;
    }

    return $sum;
}

printf "p2(5) = %d\n", p2(5);
printf "p2(10) = %d\n", p2(10);
printf "p2(4000000) = %d\n", p2();
