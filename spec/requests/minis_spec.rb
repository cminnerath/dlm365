require 'rails_helper'

RSpec.describe "Minis", type: :request do
  describe "GET /minis" do
    it "works! (now write some real specs)" do
      get minis_path
      expect(response).to have_http_status(200)
    end
  end
end
