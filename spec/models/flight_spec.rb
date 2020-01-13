require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
  end
  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many :passenger_flights}
    it {should have_many(:passengers).through(:passenger_flights)}
  end

  describe 'methods' do
    before(:each) do
      @southwest = Airline.create(name: "Southwest")

      @flight_1 = @southwest.flights.create!(number: "123", date: "01/11/20", time: "13:00", departure_city: "Denver, CO", arrival_city: "San Francisco, CA")

      @passenger_1 = Passenger.create!(name: "Melissa", age: 34)
      @passenger_2 = Passenger.create!(name: "David", age: 29)
      @passenger_3 = Passenger.create!(name: "Ali", age: 34)
      @passenger_4 = Passenger.create!(name: "Jordan", age: 16)

      @flight_1.passengers << [@passenger_1, @passenger_2, @passenger_3, @passenger_4]
    end

    it 'can count the number of adults on a flight' do

      expect(@flight_1.adult_count).to eq(3)
    end

    it 'can count the number of minors on a flight' do

      expect(@flight_1.minor_count).to eq(1)
    end
  end
end
