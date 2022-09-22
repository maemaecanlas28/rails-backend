class HelloController < ApplicationController

    def index
        render json: { hello: "World" }, status: :ok 
    end
end
