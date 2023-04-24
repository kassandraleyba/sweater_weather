class TeleportService
  def find_urban_area_salaries_by_id(id)
    get_url("/api/urban_areas/#{id}/salaries/")
    # can find chicago salaries with this url
  end
  # should follow this format
  # GET /api/v1/salaries?destination=chicago

  def find_salaries_by_destination(location)
    get_url("/api/v1/salaries?destination=#{location}")
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