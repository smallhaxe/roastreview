json.array!(@roasts) do |roast|
  json.extract! roast, :id, :roast_level, :roast_type, :coffee_name, :roaster
  json.url roast_url(roast, format: :json)
end
