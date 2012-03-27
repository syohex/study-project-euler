#!perl
use strict;
use warnings;

sub p14 {
    my $limit = shift;

    my %cache;
    my %convert_len;
    for my $n (2..($limit-1)) {
        my $times = 0;
        my $orig = $n;
        while ($n != 1) {
            if ($n % 2 == 0) {
                $n = $n / 2;
            } else {
                $n = (3 * $n) + 1;
            }

            if (exists $cache{$n}) {
                $times += $cache{$n};
                last;
            }
            $times++;
        }

        $cache{$orig} = $times;
        push @{$convert_len{$times}}, $orig;
    }

    my $max_key = (sort { $b <=> $a } keys %convert_len)[0];
    return @{$convert_len{$max_key}};
}

for my $i (100, 1_000_000) {
    printf "p14(%d) = %s\n", $i, (join ', ',  p14($i));
}
