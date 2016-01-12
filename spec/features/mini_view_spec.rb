require 'rails_helper'
require 'vcr'
require_relative '../../app/services/imdb_service.rb'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

describe 'the mini view', type: :feature do

  before(:each) do
    create_mini
  end

  it 'shows film titles' do
    expect(page).to have_content('Film Title')
    expect(page).to have_content('Gone with the Wind')
  end

  it 'shows view date' do
    expect(page).to have_content('Date Viewed')
    expect(page).to have_content('10-10-2015')
  end


  it 'shows imdb id' do
    expect(page).to have_content('IMDB ID')
    expect(page).to have_content('tt0031381')
  end

  it 'shows rating' do
    expect(page).to have_content('Rating')
    expect(page).to have_content('3')
  end
end
