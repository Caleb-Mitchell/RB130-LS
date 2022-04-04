class Series
  attr_reader :num_string

  def initialize(num_string)
    @num_string = num_string
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > num_ing.chars.size
    string_slices = num_string.chars.each_cons(slice_size).to_a
    string_slices.each { |arr| arr.map!(&:to_i) }
  end
end
