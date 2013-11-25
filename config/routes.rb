RestaurantApp::Application.routes.draw do


  resources :categories

  get "users/dashboard"
  resources :reservations
  resources :categories

  devise_for :users

  authenticated :user do
    root :to => "users#dashboard", :as => "authenticated_root"
  end
  
  root "welcome#index"

  resources :restaurants do 
    resources :reservations
    resources :stars
  end
end
