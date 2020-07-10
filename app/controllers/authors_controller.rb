class AuthorsController < ApplicationController
    skip_before_action :auth_user, only: [:show, :index]
    def show
        @author = Author.find(params[:id])
        session[:author_id] = params[:id]
    end

    def index
        @authors = Author.all
    end

    def favorite
        @current_user = User.find(session[:user_id])
        @author = Author.find(params[:id])
        @current_user.authors << @author
        redirect_back(fallback_location: author_path(@author))
    end
    
    def unfavorite
        @current_user = User.find(session[:user_id])
        @author = Author.find(params[:id])
        @current_user.authors.find_by(author_id: @author.id).destroy
        redirect_back(fallback_location: author_path(@author))
    end
end
