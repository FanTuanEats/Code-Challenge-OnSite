class OpenHour
  attr_accessor :day, :open_time, :close_time

  def initialize(day, open_hour, close_hour)
    @day = day
    @open_time = Time.new(2000, 1, 1, open_hour)
    @close_time = Time.new(2000, 1, 1, close_hour)
  end
end
