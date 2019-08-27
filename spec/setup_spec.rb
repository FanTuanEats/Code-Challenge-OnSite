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

  it 'only 3 restaurants opened in monday(wday = 1), and 1 in sunday(wday = 0)' do
    expect(@restaurants.size).to be 4

    expect(Restaurant.open_restaurants(@restaurants, 1).size).to eq(3)
    expect(Restaurant.open_restaurants(@restaurants, 0).size).to eq(1)
    expect(Restaurant.open_restaurants(@restaurants, 2).size).to eq(0)
  end

  it 'only 2 restaurants opened in monday at 11:20' do
    monday_time_1 = Time.new(2019, 8, 19, 11, 20)
    monday_time_2 = Time.new(2019, 8, 19, 7, 20)
    sunday_time_1 = Time.new(2019, 8, 18, 11, 20)

    expect(Restaurant.open_restaurants_at(@restaurants, monday_time_1).size).to eq(2)
    expect(Restaurant.open_restaurants_at(@restaurants, monday_time_2).size).to eq(0)
    expect(Restaurant.open_restaurants_at(@restaurants, sunday_time_1).size).to eq(1)
  end
end
