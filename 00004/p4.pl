#!perl
use strict;
use warnings;

sub p4 {
    my $digits = shift;

    my $start = 10 ** ($digits - 1);
    my $end   = (10 ** $digits) - 1;

    my @pairs = combination([$start..$end]);
    my @candidates = grep {
        $_->[2] = $_->[0] * $_->[1];
        is_palindromic_num($_->[2])
    } @pairs;

    return (sort { $b->[2] <=> $a->[2] } @candidates)[0];
}

sub is_palindromic_num {
    my $num = shift;
    return "$num" eq reverse("$num");
}

sub combination {
    my $list_ref = shift;

    my @pairs;
    my $length = scalar @{$list_ref};
    for (my $i = 0; $i < $length - 1; $i++) {
        for (my $j = $i; $j < $length; $j++) {
            push @pairs, [ @{$list_ref}[$i, $j] ];
        }
    }

    return @pairs;
}

for my $i (2..3) {
    my ($a, $b, $c) = @{ p4($i) };
    printf "p4(%d) (%d * %d) = %d\n", $i, $a, $b, $c;
}
