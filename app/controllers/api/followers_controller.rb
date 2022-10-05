class Api::FollowersController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]

    def index
        render json: Follower.all, excludes: ["follower.created_at", "follower.updated_at"]
    end

    def show
        followers = Follower.where(["user_id = :id", { id: params[:id] }])
        render json: followers
    end

    def follow
        follow = Follower.create!(follower_params.merge(:follower_id => session[:user_id]))
        render json: follow, status: :created
    end

    def destroy
        follower = Follower_find
        follower.destroy
        head :no_content 
    end

    def following
        following = Follower.where(follower_id: params[:id])
        render json: following, status: :ok
    end

    def unfollow
        following = Follower.find_by(:follower_id => session[:user_id], :user_id => params[:user_id])
        following.destroy
        head :no_content
    end

    private

    def follower_find
        Follower.find(params[:id])
    end

    def follower_params 
        params.permit(:user_id)
    end

end
