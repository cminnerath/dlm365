require 'open-uri'

class Film < ActiveRecord::Base
  has_attached_file :poster, styles: {
    thumb: '317x214>',
    medium: '300x300>'
  }

  validates :imdb_id, presence: true
  validates :title, presence: true
  has_many :minis
  serialize :actors
  serialize :directors
  serialize :writers
  serialize :genres

  validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/

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
    film.poster         = URI.parse( ('http://anonymouse.org/cgi-bin/anon-www.cgi/' + data.poster_url).to_s )
    film.save
    film
  end

end
