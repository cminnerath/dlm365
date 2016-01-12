class Film < ActiveRecord::Base
  validates :imdb_id, presence: true
  validates :title, presence: true
  has_many :minis
  serialize :actors
  serialize :directors
  serialize :writers
  serialize :genres

  def self.find_or_create_from_imdb_party(mini)
    data = ImdbService.grab(mini.imdb_id)
    film = Film.find_or_create_by(imdb_id: mini.imdb_id)
    film.title          = data.title
    film.release_date   = data.release_date
    film.runtime        = data.runtime
    film.poster_url     = data.poster_url
    film.tagline        = data.tagline
    film.plot           = data.plot
    film.certification  = data.certification
    film.rating         = data.rating
    film.actors         = data.actors
    film.directors      = data.directors
    film.writers        = data.writers
    film.genres         = data.genres
    film.save
    film
  end

end
