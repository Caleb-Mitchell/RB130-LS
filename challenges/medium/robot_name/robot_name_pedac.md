
# Problem

Write a program that manages robot factory settings.

input: none! just the creation of a robot object
output: a random robot name, retrieved with `name` getter method, in robot
object state

rules:

- names are two capital letters followed by three digits 1-9
- reset method should change robot name
- names should be random
- names should not be used twice

mm:

- constructor should add randomly generated name to state of object
- this name should be retrievable with public name getter method
- should be able to reset the name with a reset method
