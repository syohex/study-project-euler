#!perl
use strict;
use warnings;

sub p7 {
    my $nth = shift;

    my $iter = prime_iterator();
    $iter->() for 1..($nth-1);
    return $iter->();
}

sub notany(&;@) {
    my ($code, @list) = @_;

    for my $elm (@list) {
        local $_ = $elm;
        my $ret = $code->();

        return 0 if $ret;
    }

    return 1;
}

sub prime_iterator {
    my @primes;

    my $num = 2;
    sub {
        if ($num == 2) {
            push @primes, $num;
            $num += 1;
            return 2;
        }

        while (1) {
            my $is_prime = notany { $num % $_ == 0 } @primes;

            my $tmp = $num;
            $num += 2;
            if ($is_prime) {
                push @primes, $tmp;
                return $tmp;
            }
        }
    };
}

printf "p7(6) = %d\n", p7(6);
printf "p7(10001) = %d\n", p7(10001);
