#!perl
use strict;
use warnings;

sub p12 {
    my $divisor_num = shift;

    my $triangle_number = sub {
        my $n = shift;

        my $sum = 0;
        map { $sum += $_ } 1..$n;

        return $sum;
    };

    my $div_num = sub {
        my $n = shift;

        my %factor;
        while ($n % 2 == 0) {
            $factor{'2'}++;
            $n /= 2;
        }

        for (my $i = 3; $i <= $n;) {
            if ($n % $i == 0) {
                $factor{$i}++;
                $n /= $i;
            } else {
                $i += 2;
            }
        }

        my $count = 1;
        map { $count *= ($_ + 1) } values %factor;
        return $count;
    };

    my $i = 1;
    my $t;
    my $divisors = 0;
    while ($divisors < $divisor_num) {
        $t = $triangle_number->($i);
        $divisors = $div_num->($t);
        $i++;
    }

    return ($divisors, $t);
}

printf "p12(501) = %d, %d\n", p12(501);
