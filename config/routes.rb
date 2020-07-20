Rails.application.routes.draw do

    devise_for :users

  	resources :laps

	root to: "home#index"


  
end
