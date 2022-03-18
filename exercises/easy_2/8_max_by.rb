

=begin

mm:
save the index of the value which has the highest return value for the block
return the value of the input array referenced by that index


=end


def max_by(array)
  # return nil if array.empty?

  max_idx = nil
  max_array = []

  array.each do |ele|
    max_array << yield(ele)
  end

  max_ele = max_array.first
  max_idx = 0
  max_array.each_with_index do |big_ele, idx|
    if big_ele > max_ele
      max_idx = idx 
      max_ele = big_ele
    end
  end
  array[max_idx]
end

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil
