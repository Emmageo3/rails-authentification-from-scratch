class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            login user
            redirect_to root_path, notice: "You have signed i successfully"
        else
            flash[:alert] = "Invalid email or password"
            render :new, status: :unprocessable_entity
        end 
    end

    def destroy
        logout current_user
        redirect_to root_path, notice: "You have been logged out"
    end
end
