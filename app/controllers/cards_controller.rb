class CardsController < ApplicationController

  def index

  end

  def access_token
    redirect_to "https://www.linkedin.com/uas/oauth2/authorization?response_type=code
    &client_id=#{ENV["API_KEY"]}
    &scope=SCOPE
    &state=STATE
    &redirect_uri=https://business-card-jdo.herokuapp.com/cards"
  end

end