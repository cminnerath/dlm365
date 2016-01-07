require 'rails_helper'

describe 'the mini creation process', type: :feature do

  before(:each) do
    visit new_mini_path
  end

  it 'creates a mini' do
    expect(page).to have_content('New Mini')

    expect(page).to have_content('Film title')
    page.fill_in 'Film title', :with => 'Camp Pirate'

    expect(page).to have_content('Imdb')
    page.fill_in 'Imdb', :with => 'A659283498'

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
