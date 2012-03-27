#!perl
use strict;
use warnings;

sub p15 {
    my $n = shift;

    my $prime_hash = sub {
        my ($start, $end) = @_;

        my %prime1;
        for my $i ($start..$end) {
            while ($i % 2 == 0) {
                $prime1{'2'}++;
                $i /= 2;
            }

            for (my $j = 3; $j <= $i; ) {
                if ($i % $j == 0) {
                    $prime1{$j}++;
                    $i /= $j;
                } else {
                    $j += 2;
                }
            }
        }

        return { %prime1 };
    };

    my $prime_denominator = $prime_hash->(1, $n);
    my $prime_numerator   = $prime_hash->($n + 1, 2 * $n);

    for my $numerator (keys %{$prime_denominator}) {
        die unless exists $prime_numerator->{$numerator};
        $prime_numerator->{$numerator} -= $prime_denominator->{$numerator};
    }

    my $patterns = 1;
    while (my ($factor, $count) = each %{$prime_numerator}) {
        $patterns *= ($factor ** $count);
    }

    return $patterns;
}

for my $i ( 1, 2, 20 ) {
    printf "%d x %d = %d\n", $i, $i, p15($i);
}
