class Sensibo::Real
  attr_reader :url, :connection, :api_key

  def initialize(attributes={})
    @url        = attributes[:url]     || "https://home.sensibo.com"
    @api_key    = attributes[:api_key] || ENV["API_KEY"]
    @connection = Faraday.new(url: @url, headers: { "Content-Type" => "application/json" }) do |b|
      b.adapter :excon
    end
  end

  def request(method, path, args={})
    res = connection.send(method) do |req|
      req.url "/api/v2#{path}"
      req.params = { apiKey: self.api_key, fields: "*" }
      req.body   = Oj.dump(args[:body]) if args[:body]
    end

    Oj.load(res.body)
  end
end
