require 'spec_helper'
require_relative '../restaurant'
require_relative '../open_hour'

RSpec.describe 'OpenHour' do
  it 'testing OpenHour' do
    @open_hour = OpenHour.new(1, 11, 0, 13, 0)

    expect(@open_hour.real_at(Time.new(2019, 8, 19))).to be_a(Range)
    expect(@open_hour.real_at(Time.new(2019, 8, 18))).to be_a(nil.class)

    expect(@open_hour.is_open?(Time.new(2019, 8, 19, 10, 0))).to be(false)
    expect(@open_hour.is_open?(Time.new(2019, 8, 19, 10, 30))).to be(false)
    expect(@open_hour.is_open?(Time.new(2019, 8, 19, 11, 0))).to be(true)
    expect(@open_hour.is_open?(Time.new(2019, 8, 19, 11, 30))).to be(true)
    expect(@open_hour.is_open?(Time.new(2019, 8, 19, 13, 0))).to be(true)
    expect(@open_hour.is_open?(Time.new(2019, 8, 19, 13, 10))).to be(false)
    expect(@open_hour.is_open?(Time.new(2019, 8, 18, 11, 30))).to be(false)
  end
end

RSpec.describe 'Restaurant' do
  before do
    @restaurants = [
      Restaurant.new("Restaurant 1", [
        OpenHour.new(1, 11, 0, 13, 0),
        OpenHour.new(1, 14, 0, 20, 0),
      ]),
      Restaurant.new("Restaurant 2", [
        OpenHour.new(1, 13, 0, 16, 0),
      ]),
      Restaurant.new("Restaurant 3", [
        OpenHour.new(1, 10, 0, 13, 0),
        OpenHour.new(1, 14, 0, 20, 0),
      ]),
      Restaurant.new("Restaurant 4", [
        OpenHour.new(0, 11, 0, 13, 0),
        OpenHour.new(0, 14, 0, 20, 0),
      ])
    ]
  end

  it 'only 3 restaurants opened in day one' do
    expect(@restaurants.size).to be 4

    expect(Restaurant.open_restaurants(@restaurants, 1).size).to be 3
    expect(Restaurant.open_restaurants(@restaurants, 0).size).to be 1
    expect(Restaurant.open_restaurants(@restaurants, 2).size).to be 0
  end
end
