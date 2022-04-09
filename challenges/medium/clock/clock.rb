class Clock
  attr_reader :time

  def initialize(time)
    @time = time
  end

  def self.at(hours, minutes=0)
    time_input = [hours, minutes]
    Clock.new(time_input)
  end

  def to_s
    "#{format('%02d', time[0])}:#{format('%02d', time[1])}"
  end

  def ==(other_clock)
    time == other_clock.time
  end

  def +(minutes)
    minutes = time[1] + minutes
    hours = (time[0] += minutes / 60) % 24
    minutes = minutes % 60

    Clock.at(hours, minutes)
  end

  def -(minutes)
    hour_counter = 0
    new_minutes = time[1] - minutes
    loop do
      break if new_minutes > 0
      hour_counter += 1
      new_minutes += 60
    end

    new_hours = convert_hours(hour_counter)
    Clock.at(new_hours, new_minutes)
  end

  def convert_hours(hour_counter)
    new_hours = time[0] - hour_counter
    loop do
      break if new_hours > 0
      new_hours += 24
    end
    new_hours
  end
end

puts (Clock.at(4, 20) + 400_000).to_s
