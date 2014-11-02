Rails.application.routes.draw do

  root "home#index"

  get "/login" => "sessions#new", as: :login

  get "/cards" => "cards#index"

  get "/auth_code" => "cards#auth_code", as: :get_auth_code


end
