class MobileUser::RegistrationsController < Devise::RegistrationsController
  respond_to :json, :html
end
