require 'rails_helper'

RSpec.describe "minis/edit", type: :view do
  before(:each) do
    @mini = assign(:mini, Mini.create!(
      :film_title => "MyString",
      :imdb_id => "MyString",
      :rating => 1
    ))
  end

  it "renders the edit mini form" do
    render

    assert_select "form[action=?][method=?]", mini_path(@mini), "post" do

      assert_select "input#mini_film_title[name=?]", "mini[film_title]"

      assert_select "input#mini_imdb_id[name=?]", "mini[imdb_id]"

      assert_select "input#mini_rating[name=?]", "mini[rating]"
    end
  end
end
