class Book < ApplicationRecord
    belongs_to :author
    has_many :reviews

    def self.save_it(book_title, book_author)
        if Author.find_by(name: book_author)
            author = Author.find_by(name: book_author)
        else
            author = Author.create(name: book_author)
        end

        if Book.find_by(title: book_title, author: author)
            book = Book.find_by(title: book_title, author: author)
        else
            book = Book.create(title: book_title, author: author)
        end
        authorbook = [author, book]
    end

end
