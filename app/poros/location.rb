class Location
  attr_reader :city, :state

  def initialize(data)
    #use to retrieve lat and long for weather api
    #latLng=>{:lat=>39.74001, :lng=>-104.99202}
 
    # @city = data[:results][0][:locations][0][:adminArea5]
    # @state = data[:results][0][:locations][0][:adminArea3]
    @lat = data[:results][0][:locations][0][:latLng][:lat]
    @long = data[:results][0][:locations][0][:latLng][:lng]
  end
end