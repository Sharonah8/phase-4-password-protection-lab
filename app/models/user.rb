class User < ApplicationRecord
    has_secure_password


    # def show
    #     current_user = User.find(session[:user_id])
    #     render json: current_user
    # end
end


