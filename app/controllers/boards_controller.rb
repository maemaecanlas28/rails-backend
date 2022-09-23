class BoardsController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]

    def index
        render json: Board.all
    end

    def show
        board = board_find
        render json: board
    end

    def create
        if session[:user_id] != nil
            board = Board.create!(board_params.merge(:user_id => session[:user_id]))
            render json: board, includes: ['board.user'], status: :created
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    def update
        board = board_find
        Board.update!(board_params)
        render json: board
    end

    def destroy
        board = board_find
        Board.destroy
        head :no_content
    end

    private

    def board_find
        Board.find(params[:id])
    end

    def board_params
        params.permit(:title, :description, :category, :end_date, :tags, :user_id)
    end
end
