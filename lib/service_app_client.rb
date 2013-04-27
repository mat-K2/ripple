class ServiceAppClient
  def initialize(url)
    @conn = Faraday.new(:url => url) do |builder|
      builder.request :json
      builder.adapter :net_http
    end
  end

  def login(email, password)
    # @conn.get do |req|
    #   req.url '/ripple/sessions/create'
    #   req.body = {
    #     :session => {
    #       email: email,
    #       password: password
    #     }
    #   }.to_json
    # end
    @conn.get
  end
end
