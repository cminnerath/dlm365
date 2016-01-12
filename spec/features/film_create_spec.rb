require 'rails_helper'
require 'vcr'
require_relative '../../app/services/imdb_service.rb'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

describe 'the film creation process', type: :feature do

  before(:each) do
    visit new_mini_path
  end

  it 'creates a new film when a mini is created' do
    VCR.use_cassette("film_creation_feature", :match_requests_on => [:host]) do

      expect(page).to have_content('Film title')
      page.fill_in 'Film title', :with => 'Titanic'

      expect(page).to have_content('Imdb')
      page.fill_in 'Imdb', :with => 'tt0120338'

      expect(page).to have_content('Rating')
      page.fill_in 'Rating', :with => '3'

      expect(page).to have_content('Date viewed')
      page.fill_in 'Date viewed', :with => '10-10-2015'

      click_link_or_button 'Create Mini'

      expect(page).to have_content('Titanic')
      expect(page).to have_content('1997-12-19')
      expect(page).to have_content('194 min')
      expect(page).to have_content('http://ia.media-imdb.com/images/M/MV5BMjExNzM0NDM0N15BMl5BanBnXkFtZTcwMzkxOTUwNw@@._V1_.jpg')
    end
  end

end