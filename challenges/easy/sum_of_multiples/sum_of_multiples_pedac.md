
# Problem

Write a program that, given a natural number and a set of one or more other
numbers, can find the sum of all the multiples of the numbers in the set that
are less than the first number. If the set of numbers is not given, use a
default set of 3 and 5.

input:

- an optional set of numbers, default 3 and 5
- a natural number

output:

- an integer, the sum of all multiples of all the numbers in the set which are
less than the natural number

rules:

- if no set of numbers is provided to the constructor, use a default set of 3
and 5

mm:

- store all multiples of all numbers in set of numbers that areless than the
natural number
- return the sum of all those numbers

# DS

- array to store all multiples

algo:

- SumOfMultiples class
- def constructor with default argument, setting all arguemnts to array, or
using default value of array containing 3 and 5 only
- def instance method 'to':
  - set given number to local var max_num
  - create array multiples
  - for each number in set_array:
    - from 1 to max_num, exclusive, push all multiples to multiples array
- return sum of all values in multiples array

