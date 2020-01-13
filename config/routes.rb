Rails.application.routes.draw do

  resources :airlines, only: [:index, :show]

  resources :flights, only: [:show]

  resources :passengers, only: [:show]
end
