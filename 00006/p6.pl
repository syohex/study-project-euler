#!perl
use strict;
use warnings;

use List::Util qw(reduce);

sub p6 {
    my ($start, $end) = @_;
    my @list = ($start..$end);

    return square_of_sum(\@list) - sum_of_square(\@list);
}

sub sum_of_square {
    my $list_ref = shift;

    {
        no warnings 'once'; # for flymake
        return reduce { $a + $b } map { $_ * $_ } @{$list_ref};
    }
}

sub square_of_sum {
    my $list_ref = shift;

    {
        no warnings 'once'; # for flymake
        return (reduce { $a + $b } @{$list_ref}) ** 2;
    }
}

printf "p6(100) = %d\n", p6(1, 100);
