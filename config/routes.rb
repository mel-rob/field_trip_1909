Rails.application.routes.draw do

  resources :airlines, only: [:index, :show]

  resources :flights, only: [:show]

  post '/passengers/:id/flights', to: 'passenger_flights#create'

  resources :passengers, only: [:show]
end
