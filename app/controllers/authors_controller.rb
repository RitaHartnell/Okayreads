class AuthorsController < ApplicationController
    skip_before_action :auth_user, only: [:show, :index]
    def show
        @author = Author.find(params[:id])
    end

    def index
        @authors = Author.all
    end
end
