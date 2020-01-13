require 'rails_helper'

RSpec.describe "Passengers Show Page" do
  before(:each) do
    @southwest = Airline.create(name: "Southwest")

    @flight_1 = @southwest.flights.create!(number: "123", date: "01/11/20", time: "13:00", departure_city: "Denver, CO", arrival_city: "San Francisco, CA")
    @flight_2 = @southwest.flights.create!(number: "456", date: "01/14/20", time: "16:25", departure_city: "San Francisco, CA", arrival_city: "Denver, CO")
    @flight_3 = @southwest.flights.create!(number: "789", date: "01/20/20", time: "16:12", departure_city: "Denver, CO", arrival_city: "Honolulu, HI")

    @passenger_1 = Passenger.create!(name: "Melissa", age: 34)

    @flight_1.passengers << @passenger_1
    @flight_2.passengers << @passenger_1
  end

  describe "When I visit a passengers show page" do
    it 'I can see all of that passengers information' do

      visit passenger_path(@passenger_1)

      expect(page).to have_content(@passenger_1.name)
      expect(page).to have_link(@flight_1.number)
      expect(page).to have_link(@flight_2.number)

      click_link(@flight_1.number)

      expect(current_path).to eq(flight_path(@flight_1))
    end

    it 'I see a form to add a flight' do

      visit passenger_path(@passenger_1)

      expect(page).to_not have_link('789')

      expect(page).to have_content('Add Flight:')

      fill_in :flight_number, with: '789'
      click_button 'Submit'
      save_and_open_page

      expect(page).to have_content('Flight added!')
      expect(current_path).to eq(passenger_path(@passenger_1))
      expect(page).to have_link('789')

    end
  end
end
