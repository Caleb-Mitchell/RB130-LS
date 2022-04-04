
# Problem

Implement octal to decimal conversion. Given an octal input string, your program
should produce a decimal output. Treat invalid input as octal 0.

Input: a number represented by a string
Output: that number in octal, as an integer

Rules:

- invalid input should return 0
  - strings that have any non number chars are invalid
  - strings that have a number greater than or equal to 8 are invalid

- need an instance method: to_decimal

MM:

- convert number to array of chars
- return 0 if any char is a letter

- convert each char to an integer
- return 0 if any number is greater than or equal to 8

- reverse sort array
- set a counter to 0 to represent exponent value
- initialize a result var to 0

- for each number in array:
  - multiply number by (8**exponent_counter)
  - increment result var by result

- return result
