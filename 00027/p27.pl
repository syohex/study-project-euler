#!perl
use strict;
use warnings;

sub p27 {
    my $num = shift;

    my $oilar = sub {
        my ($n, $a, $b) = @_;
        return ($n * $n) + ($a * $n) + $b;
    };

    my @max_pair;
    my $max_len = 0;

    # n2 + an + b
    for my $a (-$num..$num) {
        for my $b (-$num..$num) {
            my $n = 0;
            while (1) {
                my $v = $oilar->($n, $a, $b);
                unless (is_prime($v)) {
                    if (($n + 1) > $max_len) {
                        @max_pair = ($a, $b);
                        $max_len = $n + 1;
                    }
                    last;
                }
                $n++;
            }
        }
    }

    return ($max_len, @max_pair);
}

sub is_prime {
    my $num = shift;

    return 0 if $num < 2;
    return 1 if $num == 2;

    my $limit = sqrt $num;
    for (my $i = 3; $i < $limit; $i += 2) {
        return 0 if $num % $i == 0;
    }

    return 1;
}

printf "len = %d, a = %d, b = %d\n", p27(1000)
