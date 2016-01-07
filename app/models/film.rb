class Film < ActiveRecord::Base
  validates :year, presence: true
  validates :imdb_id, presence: true
  validates :title, presence: true
  has_many :minis
end
