class RoadtripSerializer
  include JSONAPI::Serializer

  set_type :roadtrip #data, id, type portion

  attributes :start_city, :end_city, :travel_time, :weather_at_eta

  # belongs_to :user
  # set_id :id
end