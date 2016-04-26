class FilmSerializer < ActiveModel::Serializer
  has_many        :minis
  attributes      :id,
                  :title,
                  :imdb_id,
                  :year,
                  :created_at,
                  :updated_at,
                  :release_date,
                  :runtime,
                  :poster_url,
                  :tagline,
                  :plot,
                  :certification,
                  :rating,
                  :actors,
                  :directors,
                  :writers,
                  :genres,
                  :poster_file_name,
                  :poster_content_type,
                  :poster_file_size,
                  :poster_updated_at
end
