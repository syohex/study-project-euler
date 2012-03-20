#!perl
use strict;
use warnings;

sub p3 {
    my $n = shift;

    my @factors;
    push @factors, 2 if $n % 2 == 0;

    my $limit = sqrt $n;
    for (my $i = 3; $i < $limit; $i+=2) {
        push @factors, $i if $n % $i == 0;
    }

    my $is_prime = sub {
        my $num = shift;

        return 1 if $num == 1;
        return 0 if $num % 2 == 0;

        my $limit = sqrt($num);
        for (my $i = 3; $i < $limit; $i+=2) {
            return 0 if $num % $i == 0;
        }

        return 1;
    };

    my $max_prime = (grep { $is_prime->($_) } @factors)[-1];

    return $max_prime;
}

printf "p3(13195) = %d\n", p3(13195);
printf "p3(600851475143) = %d\n", p3(600851475143);
