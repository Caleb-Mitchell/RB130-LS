
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

starting with A, print a number of outer spaces equal to the number of the letter,
minus 1, then print A, then the same number of outer spaces, then a newline

for the next letter, print one less outer space, the letter, one inner_space, the
letter, then the same number of outer spaces, then a newline

this continues until the input letter is reached, and the whole process is
reversed

# Algo

- create an alphabet array
- set a var alpha_counter to zero to track current letter in alpha array
- set a var outer_spaces to index of input letter in alpha array
- set a var inner_spaces to 0
- set a var num_letters to 1

- until alpha_counter is equal to the index of the input string:
  - print outer spaces
  - print letter in alpha_array at alpha_counter
  - if num_spaces is 1, print outer spaces, then next
  - print inner_spaces
  - print letter in alpha_array at alpha_counter
  - print outer_spaces
  - print a newline

  - increment num_letters by 1 unless it is already 2
  - increment alpha_counter by 1
  - decrement outer_spaces by 1
  - increment inner_spaces by 1

- Draw bottom half

