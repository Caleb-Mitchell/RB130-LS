=begin
Write a method that takes a sorted array of integers as an argument, and returns
an array that includes all of the missing integers (in order) between the first
and last elements of the argument.

input: sorted array of integers
output: an array, with all missing integers, in
order, between the first and last elements of the argument

mm:
create empty array result
from range first element to last element
  unless element in input array, add to result array
return result
=end

# def missing(sorted_array)
#   result = []
#   (sorted_array.first..sorted_array.last).each do |ele|
#     result << ele unless sorted_array.include?(ele)
#   end
#   result
# end

def missing(sorted_array)
  result = []
  first_num = sorted_array.first
  second_num = sorted_array.last

  loop do
    result << first_num unless sorted_array.include?(first_num)
    break if first_num == second_num
    first_num += 1
  end
  result
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []
