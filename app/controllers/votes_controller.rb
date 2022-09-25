class VotesController < ApplicationController
    skip_before_action :authorize, only: [:index, :show, :destroy]

    def index
        render json: Vote.all
    end

    def show
        vote = vote_find
        render json: vote
    end

    def create
        vote = Vote.create!(vote_params.merge(:user_id => session[:user_id]))
        array_size = vote.rankings.length
        vote.rankings.map.with_index do |ranking, idx| 
            option = Option.find(ranking)
            option.score = option.score + (array_size - idx)
            option.save
        end
        render json: vote, includes: ['vote.user'], status: :created
    end

    def update
        vote = vote_find
        vote.update!(vote_params)
        render json: vote
    end

    def destroy
        vote = vote_find
        vote.destroy
        head :no_content
    end

    private

    def vote_find
        Vote.find(params[:id])
    end

    def vote_params
        # rankings is an array of OPTION IDs, NOT indeces!
        params.permit(:board_id, rankings: [])
    end
end
