RestaurantApp::Application.routes.draw do
  get "owners/dashboard"
  resources :reservations

  devise_for :owners

  authenticated :owner do
    root :to => "owners#dashboard", :as => "authenticated_root"
  end
  
  root "welcome#index"

  resources :restaurants do 
    resources :reservations
  end
end
