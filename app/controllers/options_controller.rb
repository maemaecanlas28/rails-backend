class OptionsController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]

    def index
        render json: Option.all
    end

    def show
        option = option_find
        render json: option
    end

    def create
        if session[:user_id] != nil
            option = Option.create!(option_params.merge(:user_id => session[:user_id]))
            render json: option, includes: ['option.user'], status: :created
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    private

    def option_find
        Option.find(params[:id])
    end

    def option_params
        params.permit(:name, :score, :board_id)
    end
end
