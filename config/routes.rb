Rails.application.routes.draw do

  resources :airlines, only: [:index, :show]
end
