def each_cons(array, size)
  (0..(array.length - size)).each do |idx|
    yield(*array[idx..(idx + size - 1)])
  end
  nil
end

def each_cons(array, num_items)
  
  outer_idx = 0
  loop do
    break if array.empty? || num_items > array.size
    inner_idx = outer_idx
    item_array = []
    
    num_items.times do
      item_array << array[inner_idx]
      inner_idx += 1
    end
    
    yield(*item_array)
    break if outer_idx == array.size - num_items 
    outer_idx += 1
  end
  
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
