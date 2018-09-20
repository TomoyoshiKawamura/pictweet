class TweetsController < ApplicationController
  before_action :move_to_index,except: :index

  def index
    @tweets = Tweet.page(params[:page]).per(5).all.order('created_at desc')
  end

  def new
  end

  def create
    Tweet.create(tweet_params)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private
  def tweet_params
    params.permit(:name,:image,:text)
  end


end
