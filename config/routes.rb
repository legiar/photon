Photon::Application.routes.draw do |map|
  resources :users, :user_session
  resources :albums
  
  match "/login", :to => "user_sessions#new"
  match "/logout", :to => "user_sessions#destroy"
  match "/register", :to => "users#new"
  
  root :to => "albums#index"
end
