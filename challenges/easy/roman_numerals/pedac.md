
# Problem

- write some code that converts modern decimal numbers into their Roman number
     equivalents.

- input: a decimal number, an integer
- output: a string, a roman number representing the input.

- rules:
  - I = one
  - V = five
  - X = ten
  - L = fifty
  - C = one hundred
  - D = five hundred
  - M = one thousand

  - value of 8 is created by adding one three times to five.
  - value of 9 is created by subtracting one from ten.

  - only need to go up to 3000.
  - digits which are zero are skipped.

- mm:
  - find thousanth's place, if applicable.
  - find hundred's place, if applicable.
  - find ten's place, if applicable.
  - find one's place, if applicable.
  - concert each to roman numeral string, and combine.

# Data structure

- hash contains keys as numbers in each digit, values are the string Roman
    Numeral value.

# Algo

- start with empty result string
- set variables to thousands, hundreds, tens, ones places
- for each variable:
  - push key of variable value in hash to result string
- return result string
