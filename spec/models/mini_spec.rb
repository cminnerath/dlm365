require 'rails_helper'

RSpec.describe Mini, :type => :model do
  it 'is invalid without a film title' do
    mini = Mini.new(film_title: nil)
    expect(mini).not_to be_valid
  end
end
