Rails.application.routes.draw do

  get "/", to: "users#index", as: :home
  resources :users
  get "/networths/intro", to: "networths#index", as: :networths_start
  resources :networths
end
