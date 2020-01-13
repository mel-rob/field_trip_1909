class PassengerFlightsController < ApplicationController

  def create
    @passenger = Passenger.find(params[:id])
    @flight = Flight.where(number: params["flight_number"])
    @passenger.flights << @flight
    redirect_to passenger_path(@passenger)
  end
end
