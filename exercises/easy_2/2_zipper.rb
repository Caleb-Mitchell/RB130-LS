=begin
The Array#zip method takes two arrays, and combines them into a single array in
which each element is a two-element array where the first element is a value
from one array, and the second element is a value from the second array, in
order.

input: two arrays, of equal length
output: a nested array

rules:
- can assume that the two arrays are of equal length
- the original arrays should not be changed

mm:
create an outer array
for each element in the first input array (with it's index)
  create a new array
  push the element into the new array
  push the element at the same index of the second input array into the new array
  push the new array into the outer array
return the outer array
=end

def zip(array1, array2)
  outer_array = []
  array1.each_with_index do |ele, idx|
    # inner_array = []
    # inner_array << ele
    # inner_array << array2[idx]
    # outer_array << inner_array
    outer_array << [ele, array2[idx]]
  end
  outer_array
end

# LS more succintly
# def zipper(array1, array2)
#   array1.each_with_index.with_object([]) do |(element, index), result|
#     result << [element, array2[index]]
#   end
# end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
