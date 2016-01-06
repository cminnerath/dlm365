require "rails_helper"

RSpec.describe MinisController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/minis").to route_to("minis#index")
    end

    it "routes to #new" do
      expect(:get => "/minis/new").to route_to("minis#new")
    end

    it "routes to #show" do
      expect(:get => "/minis/1").to route_to("minis#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/minis/1/edit").to route_to("minis#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/minis").to route_to("minis#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/minis/1").to route_to("minis#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/minis/1").to route_to("minis#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/minis/1").to route_to("minis#destroy", :id => "1")
    end

  end
end
