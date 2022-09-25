class UsersController < ApplicationController
    skip_before_action :authorize, only: [:index, :create]

    def index
        render json: User.all
    end

    def create
        user = User.create!(user_params)
        # session[:user_id] = user.id
        render json: user, status: :created
    end

    def update
        user = user_find
        user.update!(user_params)
        render json: user
    end

    def destroy
        user = user_find
        user.destroy
        head :no_content
    end

    private

    def user_find
        User.find(params[:id])
    end

    def user_params 
        params.permit(:username, :name, :email, :password, :password_confirmation, :avatar, :date_of_birth, :gender)
    end

end
