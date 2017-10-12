json.extract! city, :id, :name, :state, :country, :lat, :lng, :created_at, :updated_at
json.url city_url(city, format: :json)
