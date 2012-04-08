#!perl
use strict;
use warnings;

sub p26 {
    my $limit = shift;

    my %candidate;

 OUTER:
    for my $i (1..$limit) {
        my $rem = 1;
        my $power = 0;

        my @nums;
        while (1) {
            while ($rem < $i) {
                $rem *= 10;
                push @nums, $rem;
            }

            $rem = $rem % $i;
            next OUTER if $rem == 0;

            my $index = find_index(\@nums, $rem);
            if (defined $index) {
                my $length = scalar(@nums) - $index;
                push @{$candidate{$length}}, $i;
                next OUTER;
            }
            push @nums, $rem;
            $rem *= 10;
        }
    }

    my $max_key = ( sort { $b <=> $a } keys %candidate )[0];
    return ($candidate{$max_key}, $max_key);
}

sub find_index {
    my ($array_ref, $elm) = @_;

    my $index = 0;
    for my $e (@{$array_ref}) {
        return $index if $e == $elm;
        $index++;
    }

    return;
}

my ($nums, $max_len) = p26(1000);
printf "p26(1000) = %s(length = %d)\n", join(',', @{$nums}), $max_len;
