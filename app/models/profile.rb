class Profile

  def self.get_profile(token)

    conn = Faraday.new(:url => 'https://api.linkedin.com') do |faraday|
      faraday.request :url_encoded # form-encode POST params
      faraday.response :logger # log requests to STDOUT
      faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
    end

    conn.headers["Content-Type"] = "application/json"
    conn.headers["Authorization"] = "Bearer " + token

    response = conn.get do |req|
      req.url '/v1/people/~'
    end
    p "*" * 80
    p response.body
  end
end