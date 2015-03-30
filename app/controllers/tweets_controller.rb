class TweetsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :edit]

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      flash[:notice] = "Tweet successfully added!"
      redirect_to  tweets_path
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet= Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      flash[:notice] = "Tweet successfully edited!"
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:notice] = "Tweet successfully deleted!"
    redirect_to tweets_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
