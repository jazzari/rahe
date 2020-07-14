Rails.application.routes.draw do

  devise_for :users, only: []

	root to: "home#index"

	resources :laps
  
end
