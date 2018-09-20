class TweetsController < ApplicationController

  def index
    @tweets = Tweet.page(params[:page]).per(5).all.order('created_at desc')
  end

  def new
  end

  def create
    Tweet.create(tweet_params)
  end

  private
  def tweet_params
    params.permit(:name,:image,:text)
  end


end
