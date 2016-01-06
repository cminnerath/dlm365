json.array!(@minis) do |mini|
  json.extract! mini, :id, :film_title, :imdb_id, :rating
  json.url mini_url(mini, format: :json)
end
