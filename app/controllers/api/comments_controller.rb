class Api::CommentsController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]

    def index
        render json: Comment.all
    end

    def show
        comment = comment_find
        render json: comment
    end

    def create
        if session[:user_id] != nil
            comment = Comment.create!(comment_params.merge(:user_id => session[:user_id]))
            render json: comment, includes: ['comment.user'], status: :created
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    def update
        comment = comment_find
        comment.update!(comment_params)
        render json: comment
    end

    def destroy
        comment = comment_find
        comment.destroy
        head :no_content
    end

    private

    def comment_find
        Comment.find(params[:id])
    end

    def comment_params
        params.permit(:message, :board_id)
    end
end
