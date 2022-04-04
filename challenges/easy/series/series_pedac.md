
# Problem

Write a program that will take a string of digits and return all the possible
consecutive number series of a specified length in that string.

input: a string of digits
output: an array of arrays, each subarray containing all consecutive number
series you could make from the input string, as integers

## rules

- class constructor takes string as argument
- slices instance method takes size of slices as argument
- slices method should raise an ArgumentError if argument passed to series is
greater than the size of the input string.

## mm

for number passed to slices method, find all consecutive slices from number
string of that size and move them to an array as sub arrays

# Algo

- store number string to instance variable
- slices method:
  - create empty results array
  - convert num string to an array of characters
  - for each slice of size passed as argument to slices method:
    - put that slice in an array, and push that array to the empty results array
  - convert numbers within results to integers
  - return results array
