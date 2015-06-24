json.array!(@cafes) do |cafe|
  json.extract! cafe, :id, :name, :address, :lat, :lng, :roaster
  json.url cafe_url(cafe, format: :json)
end
