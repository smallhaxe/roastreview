json.array!(@roasts) do |roast|
  json.extract! roast, :id, :color, :type, :coffee_name, :roaster
  json.url roast_url(roast, format: :json)
end
