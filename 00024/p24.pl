#!perl
use strict;
use warnings;

sub p24 {
    my ($limit) = @_;

    my @nums;
    for my $p ( @{ permutation([0..9]) } ) {
        push @nums, join '', @{$p};
    }

    return (sort @nums)[$limit - 1];
}

sub permutation {
    my ($array_ref) = @_;

    my @answers;
    if (scalar @{$array_ref} == 0) {
        return [[]];
    } else {
        for my $i (@{$array_ref}) {
            my %tmp;
            map { $tmp{$_} = 1 } @{$array_ref};
            my @elems = grep { $i ne $_ } keys %tmp;

            my $sub_permutation = permutation([@elems]);
            for my $j (@{$sub_permutation}) {
                push @answers, [ $i, @{$j} ];
            }
        }
    }

    return [ @answers ];
}

printf "p24() = %d\n", p24(1_000_000);
