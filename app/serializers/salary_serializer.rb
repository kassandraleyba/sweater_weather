class ForecastSerializer
  include JSONAPI::Serializer

  attributes :destination, :forecast, :salaries
end