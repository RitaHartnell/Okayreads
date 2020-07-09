class SessionsController < ApplicationController
skip_before_action :auth_user, only: [:login, :create, :index]
    
    def index
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end

    def logout
        session.delete(:user_id)
        redirect_to root_path
    end

    def login
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id 
            redirect_to user 
        else   
            redirect_to new_login_path
        end
    end


end
