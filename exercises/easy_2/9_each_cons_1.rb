

def each_cons(array)
  (0...array.length-1).each do |idx|
    yield(array[idx],array[idx+1])
  end
  nil
end



def each_cons(array)
  idx1 = 0
  idx2 = 1
  
  loop do
    break if array.empty?
    ele1 = array[idx1]
    ele2 = array[idx2]
    yield(ele1, ele2)
    break if idx2 == array.size - 1
    idx1 += 1
    idx2 += 1
  end
  
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
