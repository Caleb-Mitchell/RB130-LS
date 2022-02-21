def reduce(array, default = nil)
  counter = 0
  acc = default

  if array.empty?
    acc = nil
  elsif array.all? { |ele| ele.is_a? String }
    acc ||= ''
  elsif array.all? { |ele| ele.is_a? Array }
    acc ||= []
  elsif array.all? { |ele| ele.is_a? Integer }
    acc ||= 0
  end

  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end

  acc.class
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

p reduce(['a', 'b', 'c'], 'd') { |acc, value| acc += value }
p reduce([]) { |acc, value| acc += value }
