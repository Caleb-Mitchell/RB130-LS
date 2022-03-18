=begin

Write a method that takes an optional block. If the block is specified, the
method should execute it, and return the value returned by the block. If no
block is specified, the method should simply return the String 'Does not
compute.'.

=end

def compute(arg)
  block_given? ? yield(arg) : "Does not compute."
end


# puts compute { 5 + 3 } == 8
# puts compute { 'a' + 'b' } == 'ab'
# puts compute == 'Does not compute.'

puts compute('hi!') == "Does not compute."
puts compute('hi!') { |ele| ele } == "hi!"
puts compute('hi!') { |ele| ele.chars } == ['h', 'i', '!']
