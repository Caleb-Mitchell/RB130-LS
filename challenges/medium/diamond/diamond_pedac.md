
# Problem

The diamond exercise takes as its input a letter, and outputs it in a diamond
shape. Given a letter, it prints a diamond starting with 'A', with the supplied
letter at the widest point.

input: a letter, a string
output: a string, in the shape of a diamond, with letters forming the shape

rules:

- The first row contains one 'A'.
- The last row contains one 'A'.
- All rows, except the first and last, have exactly two identical letters.
- The diamond is horizontally symmetric.
- The diamond is vertically symmetric.
- The diamond has a square shape (width equals height).
- The letters form a diamond shape.
- The top half has the letters in ascending order.
- The bottom half has the letters in descending order.
- The four corners (containing the spaces) are triangles.

mm:

draw the top point
  starting with A, print a number of outer spaces equal to the index of the
  input letter, then print A, then the same number of outer spaces, then a
  newline

draw the inner top half of the diamond

  for the next letter, print one less outer space, the next letter, one
  inner_space, the letter, then the same number of outer spaces, then a newline

this continues until the input letter is reached and printed

draw the inner bottom half of the diamon

draw the bottom point

# Algo

- create an alphabet array
- set a var alpha_counter to zero to track current letter in alpha array
- set var input_index to the index of the input letter in the alphabet array

- set a var outer_spaces to input index
- set a var inner_spaces to 1

- DRAW THE DIAMOND POINT
  - spaces equal to input_index
  - if input letter is 'A', return string after drawing one point
- DRAW THE INNER TOP HALF if input_index > 1
- DRAW THE MIDDLE
- DRAW THE INNER BOTTOM HALF if input_index > 1
- DRAW THE DIAMOND POINT
