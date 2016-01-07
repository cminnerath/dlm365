require 'rails_helper'

RSpec.describe Film, :type => :model do
  it 'is invalid without a film title' do
    film = Film.new(title: nil)
    expect(film).not_to be_valid
  end

  it 'is invalid without an imdb id' do
    film = Film.new(imdb_id: nil)
    expect(film).not_to be_valid
  end

  it 'is invalid with a non-integer year' do
    film = Film.new(year: 'aces')
    expect(film).not_to be_valid
  end

  it 'is valid' do
    film = Film.new(title: 'U.N.C.L.E', imdb_id: 'tt93434834', year: 2015)
    expect(film).to be_valid
  end
end
