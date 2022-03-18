items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end


# gather(items) do |*not_wheat , wheat|
#   puts not_wheat.join(", ")
#   puts wheat
# end

# gather(items) do |apples, *c_words, wheat|
#   puts apples
#   puts c_words.join(', ')
#   puts wheat
# end

# gather(items) do |apples, *other|
#   puts apples
#   puts other.join(', ')
# end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
