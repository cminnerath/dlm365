require 'rails_helper'

describe 'the mini view', type: :feature do

  let(:mini) { Mini.create(film_title: 'Camp Pirate', imdb_id: 'A659283498', rating: '3', date_viewed: '10-10-2015') }

  before(:each) do
    visit mini_path(mini)
  end

  it 'shows film titles' do
    expect(page).to have_content('Film Title')
    expect(page).to have_content('Camp Pirate')
  end

  it 'shows view date' do
    expect(page).to have_content('Date Viewed')
    expect(page).to have_content('10-10-2015')
  end


  it 'shows imdb id' do
    expect(page).to have_content('IMDB ID')
    expect(page).to have_content('A659283498')
  end

  it 'shows rating' do
    expect(page).to have_content('Rating')
    expect(page).to have_content('3')
  end
end
