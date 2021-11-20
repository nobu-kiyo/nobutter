class TweetsController < ApplicationController
    
    before_action :move_to_index, except: [:index, :show]
    
    def index
        @tweets = Tweet.includes(:user)
    end
    
    def new
    end
    
    def create
        Tweet.create(recommend: tweet_params[:recommend], reason: tweet_params[:reason], user_id: current_user.id)
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        if tweet.user_id == current_user.id
            tweet.destroy
        end
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def update
        tweet = Tweet.find(params[:id])
        if tweet.user_id == current_user.id
            tweet.update(tweet_params)
        end
    end
    
    def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments.includes(:user)
    end
    
    private
    def tweet_params
        params.permit(:recommend, :reason)
    end
    
    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end
    
end
