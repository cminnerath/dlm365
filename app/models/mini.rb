class Mini < ActiveRecord::Base
  validates :film_title, presence: true
  validates :imdb_id, presence: true
  validates :rating, numericality: true
  validates :date_viewed, :timeliness => {:type => :date}
end
