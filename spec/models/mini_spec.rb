require 'rails_helper'

RSpec.describe Mini, :type => :model do
  it 'is invalid without a film title' do
    mini = Mini.new(film_title: nil)
    expect(mini).not_to be_valid
  end

  it 'is invalid without an imdb id' do
    mini = Mini.new(imdb_id: nil)
    expect(mini).not_to be_valid
  end

  it 'is invalid with a non-integer rating' do
    mini = Mini.new(imdb_id: "a")
    expect(mini).not_to be_valid
  end

  it 'is valid' do
    mini = Mini.new(film_title: 'Musical Goats', imdb_id: 'A659283666', rating: '1')
    expect(mini).to be_valid
  end
end
