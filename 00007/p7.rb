#!/usr/bin/env ruby
# -*- coding:utf-8 -*-

class P7
  def initialize()
    @primes = []
    @num = 2
  end

  def next_prime()
    if @num == 2
      @primes.push(2)
      @num += 1
      2
    else
      loop do
        tmp = @num
        is_prime = !@primes.any? do |elm|
          @num % elm == 0
        end

        @num += 2
        if is_prime
          @primes.push(tmp)
          return tmp
        end

      end
    end
  end

end

p = P7.new
time = 10001
(time - 1).times do |n|
  p.next_prime
end
puts p.next_prime
