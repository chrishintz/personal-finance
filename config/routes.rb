Rails.application.routes.draw do

  get "/", to: "users#index", as: :home
  get "/dashboard/:id", to: "users#dashboard", as: :dashboard
  get "/networths/intro", to: "networths#index", as: :networths_start
  resources :users
  resources :networths

  post   "/sign-in",                 to: "sessions#sign_in",      as: :sign_in

end
