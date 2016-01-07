json.array!(@minis) do |mini|
  json.extract! mini, :id, :film_title, :date_viewed, :imdb_id, :rating
  json.url mini_url(mini, format: :json)
end
