class Api::BoardsController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]

    def index
        render json: Board.all
    end

    def show
        board = board_find
        render json: board
    end

    def boards_by_users
        boards = Board.where(user_id: boards_by_users_params[:user_id])
        render json: boards
    end 

    def boards_ranked
        rankings = Vote.where(user_id: boards_by_users_params[:user_id])
        board_ids = rankings.map do |ranking|
            ranking.board_id
        end
        boards = Board.where(id: board_ids)
        render json: boards
    end

    def create
        board = Board.create!(board_params.merge(:user_id => session[:user_id]))
        params[:options].map do |option|
            Option.create!(name: option[:name], score: 0, board_id: board.id, option_image: option[:option_image])
        end
        render json: board, includes: ['board.user'], status: :created
    end

    def update
        board = board_find
        if session[:user_id] == board.user.id
            board.update!(board_params)
            render json: board
        else
            render json: { error: "Not authorized" }, status: :unprocessable_entity
        end      
    end

    def destroy
        board = board_find
        if session[:user_id] == board.user.id
            board.destroy
            head :no_content
        else
            render json: { error: "Not authorized" }, status: :unprocessable_entity
        end
    end

    private

    def board_find
        Board.find(params[:id])
    end

    def board_params
        params.permit(:title, :description, :category, :end_date, :user_id, tags: [])
    end

    def boards_by_users_params
        params.permit(:user_id)
    end
end
