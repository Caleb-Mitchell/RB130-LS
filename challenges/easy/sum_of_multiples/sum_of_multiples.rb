class SumOfMultiples
  attr_reader :num_set

  def initialize(*num_set)
    if num_set.empty?
      @num_set = [3, 5]
    else
      @num_set = num_set
    end
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end

  def to(num)
    max_num = num
    multiples = [0]

    num_set.each do |array_num|
      (1...max_num).each { |range_num| multiples << range_num if range_num % array_num == 0 }
    end
    multiples.uniq.reduce(:+)
  end
end
