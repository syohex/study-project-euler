#!/usr/bin/env python

def p1(n=1000):
    return sum([x for x in range(1, n) if x % 3 == 0 or x % 5 == 0])

print("p1(10) = %d" % p1(10))
