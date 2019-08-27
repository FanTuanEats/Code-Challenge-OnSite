class Restaurant
  attr_accessor :name
  attr_accessor :open_hours

  def initialize(name, open_hours = [])
    @name = name
    @open_hours = open_hours
  end

  def self.open_restaurants(restaurants, wday)
    restaurants.select do |restaurant|
      restaurant.open_hours.select { |open_hour| open_hour.wday == wday }.any?
    end
  end
end
