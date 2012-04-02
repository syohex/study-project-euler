#!perl
use strict;
use warnings;

use 5.010;

sub p19 {
    my ($start_y, $start_m, $end_y, $end_m) = @_;

    my $last_wod = 1;
    my $bom = sub {
        my ($y, $m) = @_;

        my $days = 28;
        if ($m ~~ [4, 6, 9, 11]) {
            $days = 30;
        } elsif ($m == 2) {
            if ($y % 4 == 0) {
                if ($y % 100 == 0 && $y % 400 != 0) {
                    $days = 28;
                } else {
                    $days = 29;
                }
            }
        } else {
            $days = 31;
        }

        $last_wod = ($last_wod + $days) % 7;
        return $last_wod;
    };

    $bom->(2000, $_) for 1..12;

    my @boms;
    for my $y ($start_y..$end_y) {
        for my $m (1..12) {
            if ($y == $end_y && $m >= $end_m) {
                last;
            }

            push @boms, $bom->($y, $m);
        }
    }

    return scalar grep { $_ == 0 } @boms;
}

my $ans = p19(1901, 1, 2000, 12);

print "p19() = $ans\n";
