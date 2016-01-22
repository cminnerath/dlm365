module OmniauthService
  def mock_auth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '12354'})
  end
end
