class OpenHour
  attr_accessor :wday, :open_time, :close_time

  def initialize(wday, open_hour, open_min, close_hour, close_min)
    @wday = wday
    @open_time = Time.new(2000, 1, 1, open_hour, open_min)
    @close_time = Time.new(2000, 1, 1, close_hour, close_min)
  end

  def real_at(time = Time.now)
    return nil unless time.wday == wday
    start_time = Time.new(time.year, time.month, time.day, open_time.hour, open_time.min)
    end_time = Time.new(time.year, time.month, time.day, close_time.hour, close_time.min)
    (start_time..end_time)
  end

  def is_open?(time)
    open_at = real_at(time)
    return false if open_at.nil?
    open_at.cover?(time)
  end
end
