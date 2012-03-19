#!/usr/bin/env ruby
# -*- coding:utf-8 -*-

def p1(n=1000)
  lst = (1...n).select do |elm|
    elm % 3 == 0 || elm % 5 == 0
  end

  lst.inject(0) do |sum, elm|
    sum += elm
    sum
  end
end

puts "p1(10) = #{p1(10)}"
puts "p1(1000) = #{p1(1000)}"
