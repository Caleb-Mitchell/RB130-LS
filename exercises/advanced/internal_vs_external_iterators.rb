=begin

Problem
- create a new enumerator object
- we want to create an Enumerator that can iterate over an infinite list of factorials
- once this is made, print out the first 7 factorial values, starting with zero factorial

=end

fact = Enumerator.new do |yielder|
  counter = 0

  loop do
    fact_total = 1

    if counter == 0 || counter == 1
      yielder << fact_total
    else
      fact_total = counter.downto(1) { |num| fact_total *= num }
      yielder << fact_total # the factorial of counter
    end

    counter += 1
  end
end

# p fact.take(7)
# p fact.take(3)
# fact.rewind
# p fact.take(7)

# External iterators

6.times { |number| puts "#{number}! == #{fact.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{fact.next}" }
puts "=========================="
fact.rewind
6.times { |number| puts "#{number}! == #{fact.next}" }
puts "=========================="

# Internal iterators

fact.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end
