=begin
Write a method that returns a list of all of the divisors of the positive
integer passed in as an argument. The return value can be in any sequence you
wish.

input: a positive integer
output: a list, an array, of all of the divisors of the input int

rules:
- return value can be in any order

mm:
create empty array result
from 1 to positive int:
  if num is a divisor of int, add to result
=end

def divisors(int)
  return [1] if int == 1

  result = []
  1.upto(int**(0.5)) do |num|
    if int % num == 0
      result << num
      result << int / num
    end
  end
  result.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357)
