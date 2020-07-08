class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
        session[:book_id] = params[:id]
    end

    def search
        if session[:title]
            @books = find_book(session[:title])
            @bookobjects = book_loop(@books)
        else
            @books = find_book(params[:title])
            session[:title] = params[:title]
            @bookobjects = book_loop(@books)
        end
   end

    private

    def find_book(title)
        url = "https://www.googleapis.com/books/v1/volumes?q=#{title}"
        restClientResponseObject = RestClient.get(url)
        jsonButItsAString = restClientResponseObject.body
        workable_hash = JSON.parse(jsonButItsAString)   
        @arrayOfBooks = workable_hash["items"]
    end

    def book_loop(books)
        bookobjects = []
        books.each do |book_hash|
            book_title = book_hash["volumeInfo"]["title"]
            book_author = book_hash["volumeInfo"]["authors"] && book_hash["volumeInfo"]["authors"].first
            bookobjects << Book.save_it(book_title, book_author)
        end
        bookobjects
    end
end


