class MobileUser::PasswordsController < Devise::PasswordsController
  respond_to :json, :html
end
