Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
      namespace :admin do
	    resources :simulators do
	      resources :tracks do
	        resources :cars     
	      end
	    end
	  end

	  namespace :admin do
	    resources :tracks do
	      resources :cars
	    end
	  end

    devise_for :users

  	resources :laps

	root to: "home#index"


  
end
