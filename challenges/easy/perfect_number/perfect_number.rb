require 'prime'

class PerfectNumber
  def self.classify(number)
    raise StandardError.new, 'Positive numbers please.' unless number.positive?
    return 'deficient' if number.prime?

    aliquot_sum = calculate_aliquot_sum(number)

    if aliquot_sum == number
      'perfect'
    elsif aliquot_sum > number
      'abundant'
    else
      'deficient'
    end
  end

  class << self
    private

    def calculate_aliquot_sum(number)
      divisors = []
      (1...number).each do |divisor|
        divisors << divisor if number % divisor == 0
      end
      divisors.reduce(:+)
    end
  end
end
