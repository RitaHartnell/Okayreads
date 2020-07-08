class FavoritesController < ApplicationController

    def new
    @favorite = Favorite.new
    @users = User.all 
    @authors = Author.all
    end

    def create
    @favorite = Favorite.create(favorite_params)
    redirect_to user_path(@favorite.user.id)
    end

    def edit
    @favorite = Favorite.find(params[:id]) 
    @users = User.all 
    @author = Author.all
    end

    def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(favorite_params)
    redirect_to book_path(@favorite.book.id)
    end

    def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to user_path(@favorite.user.id)
    end

    private

    def favorite_params
    params.require(:favorite).permit(:user_id, :book_id, :genre)
    end


end
