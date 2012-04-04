#!perl
use strict;
use warnings;

use List::Util qw/reduce/;

my @primes;

sub p23 {
    my $limit = shift;

    find_primes($limit);
    my %prime_of; map { $prime_of{$_} = 1 } @primes;
    my @abundant_numbers = grep {
        !exists $prime_of{$_} && is_abundant_number($_, $limit);
    } 1..$limit;

    my $len = scalar @abundant_numbers;
    my %sum_of_abundant;
    for (my $i = 0; $i < $len; $i++) {
        my $v = $abundant_numbers[$i];
        for (my $j = $i; $j < $len; $j++) {
            my $sum = $v + $abundant_numbers[$j];
            last if $sum > $limit;
            $sum_of_abundant{$sum} = 1;
        }
    }

    my %nums;
    map { $nums{$_} = 1 } 1..$limit;
    map { delete $nums{$_} } keys %sum_of_abundant;

    no warnings 'once';
    return reduce { $a + $b } keys %nums;
}

sub is_abundant_number {
    my ($num, $limit) = @_;

    my $sum = sum_of_divisors($num);

    if ($sum <= $limit && $sum > $num) {
        return 1;
    } else {
        return 0;
    }
}

my %prime_div_cache;
sub sum_of_divisors {
    my $num = shift;

    my $factor_ref = factorization($num);

    my $sum_of_divisor = 1;
    while (my ($prime, $times) = each %{$factor_ref}) {
        my $key = $prime ** $times;

        unless (exists $prime_div_cache{ $key }) {
            $prime_div_cache{$key} = prime_div_func($prime, $times);
        }
        $sum_of_divisor *= $prime_div_cache{$key};
    }

    return $sum_of_divisor - $num;
}

sub prime_div_func {
    my ($prime, $times) = @_;

    my $sum = 0;
    for my $i (0..$times) {
        $sum += ($prime ** $i);
    }

    return $sum;
}

sub factorization {
    my $num = shift;

    my %factor;
    for my $p (@primes) {
        while ($num % $p == 0) {
            $num /= $p;
            $factor{$p}++;
        }

        last if $num == 1;
    }

    return \%factor;
}

sub find_primes {
    my $num = shift;

    my %nums;
    map { $nums{$_} = 1 } 2..$num;

    for my $n (2..$num) {
        next unless exists $nums{$n};

        push @primes, $n;

        my $i = $n + $n;
        while ($i <= $num) {
            delete $nums{$i};
            $i += $n;
        }
    }
}

printf "p23(28123) = %d\n", p23(28123);
