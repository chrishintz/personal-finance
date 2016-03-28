Rails.application.routes.draw do

  get "/", to: "users#index", as: :home
  get "/dashboard/:id", to: "users#dashboard", as: :dashboard
  get "/networths/intro", to: "networths#index", as: :networths_start
  get "/data",            to: "users#data",      as: :data
  get "/assets",          to: "networths#assets"
  get "/liabilities",     to: "networths#liabilities"
  get "/networth-calc",   to: "networths#networth_calc"
  resources :users
  resources :networths

  post   "/sign-in",      to: "sessions#sign_in",      as: :sign_in
  get    "/sign-out",     to: "sessions#destroy",      as: :signout


end
