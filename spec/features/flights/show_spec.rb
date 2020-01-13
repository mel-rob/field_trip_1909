require 'rails_helper'

RSpec.describe "Flights Show Page" do
  before(:each) do
    @southwest = Airline.create(name: "Southwest")

    @flight_1 = @southwest.flights.create!(number: "123", date: "01/11/20", time: "13:00", departure_city: "Denver, CO", arrival_city: "San Francisco, CA")

    @passenger_1 = Passenger.create!(name: "Melissa", age: 34)
    @passenger_2 = Passenger.create!(name: "David", age: 29)
    @passenger_3 = Passenger.create!(name: "Ali", age: 34)

    @flight_1.passengers << [@passenger_1, @passenger_2, @passenger_3]
  end

  describe "When I visit a flights show page" do
    it 'I can see all of that flights information' do

      visit flight_path(@flight_1)

      expect(page).to have_content(@flight_1.number)
      expect(page).to have_content(@flight_1.date)
      expect(page).to have_content(@flight_1.time)
      expect(page).to have_content(@flight_1.departure_city)
      expect(page).to have_content(@flight_1.arrival_city)
    end

    it 'I see the name of the airline this flight belongs to' do

      visit flight_path(@flight_1)

      expect(page).to have_content(@southwest.name)
    end

    it 'I see the names of all of the passengers on this flight' do

      visit flight_path(@flight_1)

      expect(page).to have_content(@passenger_1.name)
      expect(page).to have_content(@passenger_2.name)
      expect(page).to have_content(@passenger_3.name)
    end
  end
end
