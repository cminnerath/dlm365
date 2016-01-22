class Mini < ActiveRecord::Base
  validates :film_title, presence: true
  validates :imdb_id, presence: true
  validates :rating, numericality: true
  validates :user_id, presence: true
  validates :date_viewed, :timeliness => {:type => :date}
  belongs_to :film
  belongs_to :user
end
