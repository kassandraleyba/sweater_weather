class TeleportService
  def find_urban_area_salaries(city)
    # get_url("/api/urban_areas/#{id}/salaries/")
    get_url("/api/urban_areas/#{city}/salaries/")
    # can find chicago salaries with this url
  end
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.teleport.org")
    # doesn't use api key - don't need to pass in params
  end
end