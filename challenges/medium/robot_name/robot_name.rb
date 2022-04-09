class Robot
  attr_reader :name

  @@previous_names = []

  def initialize
    @name = generate_name
  end

  def reset
    @@previous_names.delete(name)
    @name = generate_name
  end

  private

  def previous_names
    @@previous_names
  end

  def generate_name
    alpha_array = ('A'..'Z').to_a

    random_name = ''
    loop do
      random_name_array = [alpha_array[rand(1..24)], alpha_array[rand(1..24)],
                           rand(1..9), rand(1..9), rand(1..9)]
      random_name = random_name_array.join
      break unless previous_names.include?(random_name)
    end

    previous_names << random_name
    random_name
  end
end

10.times do
  robot = Robot.new
  puts robot.name
end
