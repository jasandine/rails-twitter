class TweetsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :edit]
  respond_to :html, :js

  def index
    @tweets = Tweet.all.order("created_at DESC").page(params[:page])
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
      respond_to do |format|
        format.html { redirect_to  tweets_path }
        format.js { flash[:notice] = "Tweet successfully added!" }
      end
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to  tweets_path }
      format.js { flash[:notice] = "Tweet successfully deleted!" }
    end
  end

private
  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
