RestaurantApp::Application.routes.draw do
  resources :categories

  get "owners/dashboard"
  resources :reservations
  resources :categories

  devise_for :owners

  authenticated :owner do
    root :to => "owners#dashboard", :as => "authenticated_root"
  end
  
  root "welcome#index"

  resources :restaurants do 
    resources :reservations
  end
end
