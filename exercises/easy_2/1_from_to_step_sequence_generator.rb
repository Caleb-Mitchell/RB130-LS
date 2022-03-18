
def step(first, last, step_value)
  counter = first
  loop do
    yield(counter)
    break if counter >= last
    counter += step_value
  end
  nil
end



step(1, 10, 3) { |value| puts "value = #{value}" }
