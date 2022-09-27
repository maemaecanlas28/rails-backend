class FollowersController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]

    def index
        render json: Follower.all, excludes: ["follower.created_at", "follower.updated_at"]
    end

    def show
        follower = follower_find
        render json: follower
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
        following = Follower.where(follower_id: session[:user_id])
        render json: following, status: :ok
    end

    private

    def follower_find
        Follower.find(params[:id])
    end

    def follower_params 
        params.permit(:user_id)
    end

end
