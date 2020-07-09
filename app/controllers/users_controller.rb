class UsersController < ApplicationController
    skip_before_action :auth_user, only: [:new, :create]


    def show
        @user = User.find(params[:id])
        if @user == @current_user
        else  
            redirect_to books_path
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:myerrors] = @user.errors.full_messages
            #byebug
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash[:myerrors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :displayname, :age, :location)
    end
end
