require 'vcr'
require_relative '../../app/services/imdb_service.rb'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

RSpec.describe 'ImdbService' do
  it 'retrieves the film data from Imdb' do
    VCR.use_cassette("imdb_film_data", :match_requests_on => [:host]) do
      movie = ImdbService.grab("tt0120338")
      expect(movie.title).to eq "Titanic"
      expect(movie.release_date).to eq "1997-12-19"
      expect(movie.runtime).to eq "194 min"
      expect(movie.poster_url).to eq "http://ia.media-imdb.com/images/M/MV5BMjExNzM0NDM0N15BMl5BanBnXkFtZTcwMzkxOTUwNw@@._V1_.jpg"
    end
  end
end
