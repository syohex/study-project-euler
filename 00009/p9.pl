#!perl
use strict;
use warnings;

sub p9 {
    my $limit = shift;

    my @answers;

    my $a_limit = ($limit / 3);
    for (my $a = 1; $a < $a_limit; $a++) {
        my $b_limit = ($limit - $a) / 2;
        for (my $b = $a; $b < $b_limit; $b++) {
            my $c = $limit - ($a + $b);
            if ((($a ** 2) + ($b ** 2)) == ($c ** 2)) {
                push @answers, [$a, $b, $c];
            }
        }
    }

    return @answers;
}

my @answers = p9(1000);
for my $ans ( @answers ) {
    printf "%d^2 + %d^2 = %d^2\n", @{$ans}[0..2];
}
