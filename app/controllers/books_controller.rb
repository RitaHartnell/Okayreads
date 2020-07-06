class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def search
    books = find_book(params[:title])
    @arrayOfBooks
    end

    private

    def find_book(title)
        url = "https://www.googleapis.com/books/v1/volumes?q=#{(params[:title])}"
        restClientResponseObject = RestClient.get(url)
        jsonButItsAString = restClientResponseObject.body
        workable_hash = JSON.parse(jsonButItsAString)   
        @arrayOfBooks = workable_hash["items"]
    end

end


