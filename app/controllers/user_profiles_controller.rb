# frozen_string_literal: true

class UserProfilesController < ApplicationController
  before_action :set_user_profile

  def edit; end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to user_profiles_path,
                  notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user_profile
    @user_profile = current_user&.user_profile
  end

  def user_profile_params
    params.require(:user_profile)
      .permit(:username, :first_name, :last_name, :birthday, :bio, :user_id)
  end
end
