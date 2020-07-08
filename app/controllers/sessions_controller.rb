class SessionsController < ApplicationController
skip_before_action :auth_user, only: [:login, :create]
    
    def logout
    session.delete(:user_id)
    redirect_to books_path
    end

    def login
    end

    def create
    user = User.find_by(username: params[:session][:username])
    if user.authenticate(params[:session][:password])
        session[:user_id] = user.id 
        redirect_to user 
    else   
        redirect_to new_login_path
    end
  end


end
