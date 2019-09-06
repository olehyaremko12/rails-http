# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    @tweets = current_user.tweets.reverse
    @users  = User.all.except(current_user)
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to root_path,
                  flash: { notice: 'Tweet was successfully created.' }
    else
      redirect_to root_path,
                  flash: { error: @tweet.errors.full_messages.to_sentence }
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end
end
