module ImdbService

  def self.grab(imdb_id)
    imdb = ImdbParty::Imdb.new(:anonymize => true)
    movie = imdb.find_movie_by_id(imdb_id)
    movie
  end

end
