require 'rails_helper'

RSpec.describe "minis/index", type: :view do
  before(:each) do
    assign(:minis, [
      Mini.create!(
        :film_title => "Film Title",
        :imdb_id => "Imdb",
        :rating => 1,
        :date_viewed => '10-10-2015'
      ),
      Mini.create!(
        :film_title => "Film Title",
        :imdb_id => "Imdb",
        :rating => 1,
        :date_viewed => '10-10-2015'
      )
    ])
  end

  it "renders a list of minis" do
    render
    assert_select "tr>td", :text => "Film Title".to_s, :count => 2
    assert_select "tr>td", :text => "Imdb".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
