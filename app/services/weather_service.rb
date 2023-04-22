class WeatherService
  def find_current_forecast(location)
    get_url("/v1/current.json?q=#{location}")
  end
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "http://api.weatherapi.com") do |faraday|
      faraday.params["key"] = ENV["WEATHER_API_KEY"]
    end
  end
end