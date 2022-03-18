
def block_assignment(array)
  yield(array)
end

array = %w(raven finch hawk eagle)

result = []
block_assignment(array) { |_, _, *raptors| result = raptors }
p result
# raven, finch, hawk, eagle = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p hawk # => 'hawk'
# p eagle # => 'eagle'
