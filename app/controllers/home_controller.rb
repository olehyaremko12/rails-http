# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @user_profile = current_user.user_profile
    @tweets       = Tweet.all.reverse
    @users        = User.all.except(current_user)
  end
end
