class TweetsController < ApplicationController
  before_action :move_to_index,except: [:index,:show]

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).all.order('created_at desc')
  end

  def new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments =  @tweet.comments.includes(:user)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
    tweet.destroy
  end
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end

  def create
    Tweet.create(text:tweet_params[:text],image:tweet_params[:image],user_id:current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


  private
  def tweet_params
    params.permit(:image,:text)
  end


end
