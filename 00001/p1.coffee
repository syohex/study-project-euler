# Project Euler 00001
p1 = (n) ->
    lst = (x for x in [1..(n-1)] when x % 3 == 0 || x % 5 == 0)
    lst.reduce (sum, elm) -> sum + elm

console.log("p1(10) = " + p1(10))
console.log("p1(1000) = " + p1(1000))
