class FavoritesController < ApplicationController

    def new
    @favorite = Favorite.new
    @users = User.all 
    @authors = Author.all
    end

    def create
        @favorite = Favorite.new(favorite_params)
        @favorite.user = @current_user
        @favorite.save
        redirect_to user_path(@current_user)
    end

    def edit
    @favorite = Favorite.find(params[:id]) 
    @users = User.all 
    @author = Author.all
    end

    def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(favorite_params)
    redirect_to user_path(@current_user)
    end

    def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to user_path(@current_user)
    end

    private

    def favorite_params
    params.require(:favorite).permit(:genre, :author_id)
    end


end
