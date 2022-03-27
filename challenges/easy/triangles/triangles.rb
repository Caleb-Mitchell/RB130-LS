class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    raise ArgumentError.new, "Invalid triangle lengths" unless triangle?
    # raise ArgumentError unless triangle?
  end

  def kind
    return 'equilateral' if side1 == side2 && side2 == side3
    return 'isosceles' if side1 == side2 || side2 == side3 || side1 == side3
    'scalene'
  end

  private

  def triangle?
    all_sides_valid? &&
      side1 + side2 > side3 &&
      side2 + side3 > side1 &&
      side1 + side3 > side2
  end

  def all_sides_valid?
    side1 > 0 && side2 > 0 && side3 > 0
  end
end
