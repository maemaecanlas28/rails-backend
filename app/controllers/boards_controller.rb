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
        board = Board.create!(board_params.merge(:user_id => session[:user_id]))
        params[:options].map do |option|
            Option.create!(name: option[:name], score: 0, board_id: board.id, option_image: option[:option_image])
        end
        render json: board, includes: ['board.user'], status: :created
    end

    def update
        board = board_find
        board.update!(board_params)
        render json: board
    end

    def destroy
        board = board_find
        board.destroy
        head :no_content
    end

    private

    def board_find
        Board.find(params[:id])
    end

    def board_params
        params.permit(:title, :description, :category, :end_date, :user_id, tags: [])
    end
end
