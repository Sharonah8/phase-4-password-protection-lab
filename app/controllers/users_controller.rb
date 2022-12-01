class UsersController < ApplicationController
#wrap_parameters format:[]
#rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def create 
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: { error: "User not found" }, status: :unauthorized
        end
    end

    private
    def user_params
        params.permit(:username, :password, :password_confirmation)
    end

    # def render_unprocessable_entity
    #     render json: { error: invalid.record.errors}, status: :unprocessable_entity
    # end
end
