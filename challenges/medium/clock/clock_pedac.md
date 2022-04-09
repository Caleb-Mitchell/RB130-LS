
# Problem

Create a clock that is independent of date

input:

- one or two integers, representing hours and minutes
  - minutes default value should be zero custom `+` and `-` operators,
    which should add or subtract minutes from the
    string object returned by clock representing the time

output:

- a string, representing the time of the clock

rules:

- if the hour value surpasses 24, it should wrap back to zero
- custom to_s method should return the current time as a string

mm:

- clock does not need a constructor, time is set with class method `::at`

# DS

- time can be represented by an area of two values, hours and minutes

# Algo

- set the time with the class method `::at`
  - within array, hours are the first value, minutes are the second with a
  default value of 00
- `::at` method should return a clock object, which has a custom `to_s` method
defined to return the time in a specific format
