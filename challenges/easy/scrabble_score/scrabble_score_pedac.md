
# Problem

Write a program that, given a word, computes the Scrabble score for that word.

## input

- a string, representing a scrabble word.
- an empty string.
- nil.
- whitespace and a newline char.

## output

- an integer, representing a scrabble score.

## rules

A, E, I, O, U, L, N, R, S, T - 1
D, G - 2
B, C, M, P - 3
F, H, V, W, Y - 4
K - 5
J, X - 8
Q, Z - 10

1. either the score method is called, and string stored by constructor is used,
  or string can be passed straight to a class method called score.
2. string is just one word.

3. words are case insensitive.

## mm

- check if word contains letters
- iterate over letters, adding score for each to score total
- return score total

# Algo

1. init counter var to 0
2. return counter unless word(stripped) is a string
