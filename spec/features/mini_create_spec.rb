require 'rails_helper'
require 'vcr'
require_relative '../../app/services/imdb_service.rb'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

describe 'the mini creation process', type: :feature do

  before(:each) do
    visit new_mini_path
  end

  it 'creates a mini' do
    VCR.use_cassette("mini_creation_feature", :match_requests_on => [:host]) do

      expect(page).to have_content('New Mini')

      expect(page).to have_content('Film title')
      page.fill_in 'Film title', :with => 'Camp Pirate'

      expect(page).to have_content('Imdb')
      page.fill_in 'Imdb', :with => 'tt0031381'

      expect(page).to have_content('Rating')
      page.fill_in 'Rating', :with => '3'

      expect(page).to have_content('Date viewed')
      page.fill_in 'Date viewed', :with => '10-10-2015'

      click_link_or_button 'Create Mini'

      expect(page).to have_content('Mini was successfully created.')
      expect(page).to have_content('Film Title')
      expect(page).to have_content('Date Viewed')
      expect(page).to have_content('IMDB ID')
      expect(page).to have_content('Rating')
    end
  end
end
