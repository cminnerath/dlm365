require 'open-uri'

class Film < ActiveRecord::Base
  has_attached_file :poster,
  :styles => {
    thumb: '317x214>'
  }
  validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :poster, :in => 0.megabytes..2.megabytes
  validates :imdb_id, presence: true
  validates :title, presence: true
  has_many :minis
  serialize :actors
  serialize :directors
  serialize :writers
  serialize :genres

  def self.find_imdb_hash(mini)
    data = ImdbService.grab(mini.imdb_id)
    film = {    :title          => data.title,
                :imdb_id        => data.imdb_id,
                :release_date   => data.release_date,
                :runtime        => data.runtime,
                :poster_url     => data.poster_url,
                :tagline        => data.tagline,
                :plot           => data.plot,
                :certification  => data.certification,
                :rating         => data.rating,
                :actors         => data.actors,
                :directors      => data.directors,
                :writers        => data.writers,
                :genres         => data.genres,
                :poster         => URI.parse( (data.poster_url) )
          }
    film
  end
end
