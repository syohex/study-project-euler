#!/usr/bin/env ruby
# -*- coding:utf-8 -*-

def p2(limit)
  sum = 0
  i = 1
  loop do
    val = fib(i)
    break if val >= limit
    sum += val if val.even?

    i += 1
  end

  sum
end

def fib(n)
  val = 0
  case n
  when 1
    val = 1
  when 2
    val = 2
  else
    val = 0
    a, b = 1, 2
    (n-2).times do
      val = a + b
      a, b = b, a+b
    end
  end
  val
end

p p2(10)
p p2(4000000)
