require 'rails_helper'

RSpec.describe "minis/new", type: :view do
  before(:each) do
    assign(:mini, Mini.new(
      :film_title => "MyString",
      :imdb_id => "MyString",
      :rating => 1,
      :date_viewed => '10-10-2015'
    ))
  end

  it "renders new mini form" do
    render

    assert_select "form[action=?][method=?]", minis_path, "post" do

      assert_select "input#mini_film_title[name=?]", "mini[film_title]"

      assert_select "input#mini_imdb_id[name=?]", "mini[imdb_id]"

      assert_select "input#mini_rating[name=?]", "mini[rating]"
    end
  end
end
