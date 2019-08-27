class Restaurant
  attr_accessor :name
  attr_accessor :open_hours

  def initialize(name, open_hours = [])
    @name = name
    @open_hours = open_hours
  end

  def real_open_hours(time)
    open_hours.map do |open_hour|
      open_hour.real_at(time)
    end.compact
  end

  def self.open_restaurants(restaurants, wday)
    restaurants.select do |restaurant|
      restaurant.open_hours.select { |open_hour| open_hour.wday == wday }.any?
    end
  end

  def self.open_restaurants_at(restaurants, time)
    restaurants.select do |restaurant|
      restaurant.real_open_hours(time).any? do |open_at|
        open_at.cover?(time)
      end
    end
  end
end
