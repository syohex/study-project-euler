#!perl
use strict;
use warnings;

sub p30 {
    my $powered = shift;

    my $powerd_sum_limit = sub {
        my $digit = shift;
        return (9 ** $powered) * $digit;
    };

    my $digit = 1;
    while ($powerd_sum_limit->($digit) > (10 ** ($digit - 1))) {
        $digit++;
    }
    my $limit = $powerd_sum_limit->($digit - 1);

    my %answer;
    for my $i (2..$limit) {
        my @a = split //, $i;

        my $sum = 0;
        map { $sum += ($_ ** $powered) } @a;

        if ($i == $sum) {
            $answer{$i} = $sum;
        }
    }

    my $sum = 0;
    map { $sum += $_ } keys %answer;

    return $sum;
}

printf "p30() = %d\n", p30(5);
