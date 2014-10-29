Rails.application.routes.draw do

  root "home#index"

  get "/login" => "sessions#new", as: :login

  get "/cards" => "cards#index"

  get "/access_token" => "cards#access_token", as: :get_access_token


end
