
# problem

Write a program that can tell whether a number is perfect, abundant, or
deficient.

## input

- an integer, to be classified.

## output

- a string, 'perfect', 'deficient', or 'abundant'.

## rules

- prime numbers are always deficient.
- don't include the number itself in list of divisors.

1. method should raise a StandardError if negative number is passed as
   argument.

## mm

- for any given number, find its positive divisors.
- then, find the sum of its positive divisors.

- perfect if the sum is equal to the original number.
- abundant if the sum is greater than the original number.
- deficient if the sum is less than the original number.

## ds

- use array to store divisors

## algo

- raise an error unless number is positive.
- return deficient if number is prime.

- init empty array divisors.
- from range 1 to number, exclusive:
  - if number mod iterator equals 0, push iterator to divisors array.
- case statement evaluating reduced sum of divisors array.
- compare statements for appropriate return value.
