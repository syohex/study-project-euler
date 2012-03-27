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

    my $prime1 = $prime_hash->($n + 1, 2 * $n);
    my $prime2 = $prime_hash->(1, $n);

    my %common_key;
    map { $common_key{$_}++; } keys(%{$prime1}), keys(%{$prime2});

    for my $key (grep { $common_key{$_} >= 2 } keys %common_key) {
        if ($prime1->{$key} > $prime2->{$key}) {
            $prime1->{$key} -= $prime2->{$key};
            $prime2->{$key} = 0;
        } else {
            $prime2->{$key} -= $prime1->{$key};
            $prime1->{$key} = 0;
        }
    }

    use YAML; die YAML::Dump($prime1, $prime2);

    my $a = 0;
    while (my ($num, $power) = each %{$prime1}) {
        $a += ($num ** $power);
    }
}

p15(20);
