require 'rails_helper'

RSpec.describe "minis/show", type: :view do
  before(:each) do
    @mini = assign(:mini, Mini.create!(
      :film_title => "Film Title",
      :imdb_id => "Imdb",
      :rating => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Film Title/)
    expect(rendered).to match(/Imdb/)
    expect(rendered).to match(/1/)
  end
end
