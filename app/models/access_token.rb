class AccessToken

  def self.connection(code)

      conn = Faraday.new(:url => 'https://www.linkedin.com') do |faraday|
        faraday.request :url_encoded # form-encode POST params
        faraday.response :logger # log requests to STDOUT
        faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
      end

      conn.headers["Content-Type"] = "application/json"

      params = { "grant_type" => "authorization_code", "code" => code, "redirect_uri" => "http://localhost:3000/cards", "client_id" => ENV["API_KEY"], "client_secret" => ENV["SECRET_KEY"] }

      response = conn.post do |req|
        req.url '/uas/oauth2/accessToken', params
        req.headers['Content-Type'] = 'application/json'
      end

      response.body
    end

end


