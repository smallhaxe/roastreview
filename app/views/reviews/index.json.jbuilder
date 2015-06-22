json.array!(@reviews) do |review|
  json.extract! review, :id, :rating, :body, :belongs_to, :has_one
  json.url review_url(review, format: :json)
end
