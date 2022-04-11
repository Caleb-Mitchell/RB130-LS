class Meetup
  attr_reader :year, :month

  SCHEDULE_NUM = { first: 1, second: 2, third: 3, fourth: 4,
                   fifth: 5 }

  TEENTHS = [13, 14, 15, 16, 17, 18, 19]

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    current_day = Date.new(year, month)

    schedule_counter = 1
    month_date = 1
    loop do
      if current_day.monday? && weekday.downcase == 'monday'
        if schedule_counter == SCHEDULE_NUM[schedule.downcase.intern] ||
           last_day_of_month?(schedule, current_day) ||
           teenth?(schedule, current_day)
          month_date = current_day.mday
          break
        else
          schedule_counter += 1
        end
      elsif current_day.tuesday? && weekday.downcase == 'tuesday'
        if schedule_counter == SCHEDULE_NUM[schedule.downcase.intern] ||
           last_day_of_month?(schedule, current_day) ||
           teenth?(schedule, current_day)
          month_date = current_day.mday
          break
        else
          schedule_counter += 1
        end
      elsif current_day.wednesday? && weekday.downcase == 'wednesday'
        if schedule_counter == SCHEDULE_NUM[schedule.downcase.intern] ||
           last_day_of_month?(schedule, current_day) ||
           teenth?(schedule, current_day)
          month_date = current_day.mday
          break
        else
          schedule_counter += 1
        end
      elsif current_day.thursday? && weekday.downcase == 'thursday'
        if schedule_counter == SCHEDULE_NUM[schedule.downcase.intern] ||
           last_day_of_month?(schedule, current_day) ||
           teenth?(schedule, current_day)
          month_date = current_day.mday
          break
        else
          schedule_counter += 1
        end
      elsif current_day.friday? && weekday.downcase == 'friday'
        if schedule_counter == SCHEDULE_NUM[schedule.downcase.intern] ||
           last_day_of_month?(schedule, current_day) ||
           teenth?(schedule, current_day)
          month_date = current_day.mday
          break
        else
          schedule_counter += 1
        end
      elsif current_day.saturday? && weekday.downcase == 'saturday'
        if schedule_counter == SCHEDULE_NUM[schedule.downcase.intern] ||
           last_day_of_month?(schedule, current_day) ||
           teenth?(schedule, current_day)
          month_date = current_day.mday
          break
        else
          schedule_counter += 1
        end
      elsif current_day.sunday? && weekday.downcase == 'sunday'
        if schedule_counter == SCHEDULE_NUM[schedule.downcase.intern] ||
           last_day_of_month?(schedule, current_day) ||
           teenth?(schedule, current_day)
          month_date = current_day.mday
          break
        else
          schedule_counter += 1
        end
      end

      # advance day
      current_day += 1
      return nil if current_day.mon != month
    end

    Date.civil(year, month, month_date)
  end

  private

  def last_day_of_month?(schedule, current_day)
    # it's the last monday if a week from that date is a new month
    schedule == 'last' && (current_day + 7).mon != current_day.mon
  end

  def teenth?(schedule, current_day)
    schedule == 'teenth' && TEENTHS.include?(current_day.mday)
  end

  # def target_day?(schedule_counter, schedule, current_day)
    # schedule_counter == SCHEDULE_NUM[schedule.downcase.intern] ||
      # last_day_of_month?(schedule, current_day) ||
      # teenth?(schedule, current_day)
  # end

end
