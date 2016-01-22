require 'rails_helper'
require 'vcr'
require_relative '../../app/services/imdb_service.rb'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

describe 'the film serialization process', type: :feature do

  before(:each) do
    mock_auth
    visit login_path
    visit new_mini_path
  end

  it 'creates a new film with serialized aspects' do
    VCR.use_cassette("cerealol_creation_feature", :match_requests_on => [:host]) do

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
      expect(page).to have_content('Leonardo DiCaprio')
      expect(page).to have_content('Jack Dawson')
      expect(page).to have_content('Kate Winslet')
      expect(page).to have_content('Rose DeWitt Bukater')
      expect(page).to have_content('Billy Zane')
      expect(page).to have_content('James Cameron')
    end
  end

end
