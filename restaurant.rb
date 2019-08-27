class Restaurant
  attr_accessor :name
  attr_accessor :open_hours

  def initialize(name, open_hours = [])
    @name = name
    @open_hours = open_hours
  end

  def self.open_restaurants(restaurants, day)
    restaurants.select do |restaurant|
      restaurant.open_hours.select { |open_hour| open_hour.day == day }.any?
    end
  end
end
