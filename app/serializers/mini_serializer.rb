class MiniSerializer < ActiveModel::Serializer
  attributes      :id,
                  :film_title,
                  :imdb_id,
                  :rating,
                  :created_at,
                  :updated_at,
                  :date_viewed,
                  :user_id
  has_one      :film
    # def film
    #   Film.find_by(imdb_id: object.imdb_id)
    # end
end
