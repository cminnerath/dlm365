require 'rails_helper'
require 'vcr'
require_relative '../app/services/imdb_service.rb'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

def create_mini
  VCR.use_cassette("create_mini", :match_requests_on => [:host]) do
    visit new_mini_path
    page.fill_in 'Film title', :with => 'Camp Pirate'
    page.fill_in 'Imdb', :with => 'tt0031381'
    page.fill_in 'Rating', :with => '3'
    page.fill_in 'Date viewed', :with => '10-10-2015'
    click_link_or_button 'Create Mini'
  end
end
