# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: :create

    def new
      build_resource({})
      resource.build_user_profile
      respond_with resource
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_params_keys)
    end

    def sign_up_params_keys
      [user_profile_attributes: %i[username first_name last_name birthday bio]]
    end
  end
end
