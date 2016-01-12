class Film < ActiveRecord::Base
  validates :year, presence: true
  validates :imdb_id, presence: true
  validates :title, presence: true
  has_many :minis

  def self.find_or_create_from_imdb_party(data)
    film = Film.find_or_create_by(imdb_id: data.imdb_id)
    film.title          = data.title
    film.release_date   = data.release_date
    film.runtime        = data.runtime
    film.poster_url     = data.poster_url
  end
end
