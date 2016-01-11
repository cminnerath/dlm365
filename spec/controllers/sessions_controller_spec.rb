require 'spec_helper'

describe SessionsController do
  describe "#create" do

    it "logs in a new user using google" do
      @request.env["omniauth.auth"] = {
        'provider' => 'google',
        'info' => {'name' => 'Al John'},
        'uid' => 'abc123'
      }

      post :create
      user = User.find_by_uid_and_provider('abc123', 'google')
      expect(controller.current_user.id).to eq(user.id)
    end

    it "logs in an existing user" do
      @request.env["omniauth.auth"] = {
        'provider' => 'google',
        'info' => {'name' => 'Sara Stone'},
        'uid' => 'xyz456'
      }
      user = User.create(provider: 'google', uid: 'xyz456', name: 'Sara Stone')

      post :create
      expect(User.count).to eq(1)
      expect(controller.current_user.id).to eq(user.id)
    end

    it 'redirects to the companies page' do
      request.env["omniauth.auth"] = {
        'provider' => 'google',
        'info' => {'name' => 'Father Ted'},
        'uid' => 'prq987'
      }
      user = User.create(provider: 'google', uid: 'prq987', name: 'Father Ted')
      post :create
      expect(response).to redirect_to(root_path)
    end
  end
end
