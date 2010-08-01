Photon::Application.routes.draw do |map|
  resources :gallerys
  
  #match "/login", :to => "user_sessions#new"
  #match "/logout", :to => "user_sessions#destroy"
  #match "/register", :to => "users#new"
  
  root :to => "gallerys#index"
end
