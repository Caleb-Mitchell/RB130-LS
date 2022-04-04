class Octal
  attr_reader :number_string

  def initialize(number_string)
    @number_string = number_string
  end

  def to_decimal
    char_array = number_string.chars
    return 0 unless valid_octal?(char_array)

    reverse_num_array = char_array.reverse
    result = 0

    reverse_num_array.map!(&:to_i).each_with_index do |num, idx|
      result += num * (8**idx)
    end
    result
  end

  private

  def valid_octal?(array)
    array.all? { |num| ('0'..'7').to_a.include?(num) }
  end
end
