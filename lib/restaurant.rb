class Restaurant
  attr_reader :opening_time, :name, :dishes
  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
    @new_closing_time = 0
  end

  def closing_time(time)
    new_closing_time = opening_time.to_i + time.to_i
    if new_closing_time > 24
       new_closing_time %= 24
    else
      new_closing_time
    end
    (new_closing_time).to_s + ":00"
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
     return false if @opening_time.to_i > 11
     true
  end

  def menu_dish_names
    @dishes.map do |dish|
      dish.upcase
    end
  end

  def announce_closing_time(time)
    am_pm_tracker = @opening_time.to_i + time
    @new_closing_time = @opening_time.to_i + time
    closing_time_to_12hr_format
    # announcement_output
    if am_pm_tracker < 12
      "#{@name} will be closing at #{@new_closing_time.to_s + ":00AM"}"
    elsif am_pm_tracker >= 12
      "#{@name} will be closing at #{@new_closing_time.to_s + ":00PM"}"
    end

  end

  # def announcement_output
  #   if @new_closing_time < 12
  #     # require "pry"; binding.pry
  #     "#{@name} will be closing at #{@new_closing_time.to_s + ":00AM"}"
  #   elsif am_pm_tracker >= 12
  #     "#{@name} will be closing at #{@new_closing_time.to_s + ":00PM"}"
  #   end
  # end

    def closing_time_to_12hr_format
      if @new_closing_time > 24
        @new_closing_time %= 24
      elsif @new_closing_time > 12
        @new_closing_time -= 12
      else
        @new_closing_time
      end
    end
end
