class TweetsController < ApplicationController
  before_action :move_to_index,except: :index

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).all.order('created_at desc')
  end

  def new
  end

  def create
    Tweet.create(text:tweet_params[:text],image:tweet_params[:image],user_id:current_user.id)
    binding.pry
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private
  def tweet_params
    params.permit(:image,:text)
  end


end
