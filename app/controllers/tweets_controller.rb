class TweetsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :edit]
  respond_to :html, :js

  def index
    @tweets = Tweet.all.order("created_at DESC").page(params[:page])
    @search = params[:query]
     if @search == nil
       render ('tweets/index.html.erb')
     else
       @search_results = Tweet.basic_search(@search)
       render :index
     end
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
        format.js { flash.now[:notice] = "Tweet successfully added!" }
      end
    else
      format.js { flash.now[:alert] = "Tweet body cannot be blank!" }
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to  tweets_path }
      format.js { flash.now[:notice] = "Tweet successfully deleted!" }
    end
  end

  # def search
  #   @tweets = Tweet.search do
  #     keywords params[:tweet_id]
  #   end.results
  #
  #   respond_to do |format|
  #     format.html { render :action => "tweets" }
  #     format.xml { render :xml => @tweets }
  #   end
  # end

private
  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
