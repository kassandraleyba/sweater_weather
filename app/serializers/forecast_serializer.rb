class ForecastSerializer
  include JSONAPI::Serializer
  set_type :forecast #data, id, type portion

  attributes :current_weather, :five_day_weather, :hourly_weather
end