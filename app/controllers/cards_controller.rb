require "json"
class CardsController < ApplicationController

  def index
    code = params["code"]

    value = AccessToken.connection(code)

    hash = JSON.parse(value, opts ={})
    access_token = hash["access_token"]

    Profile.get_profile(access_token)
  end

  def auth_code
    encoded_url = URI.encode("https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=#{ENV["API_KEY"]}&scope=r_basicprofile&state=JDOEFERTGHdffef424&redirect_uri=http://localhost:3000/cards")
    redirect_to "#{URI.parse(encoded_url)}"
  end

  private

  def access_token
    AccessToken.connection(code)
  end

end