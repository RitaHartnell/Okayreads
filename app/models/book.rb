class Book < ApplicationRecord
    belongs_to :author
    has_many :reviews

    def self.save_it(book_title, book_author)
        author = Author.create(name: book_author) unless Author.find_by(name: book_author)
        book = Book.create(title: book_title, author: author) unless Book.find_by(title: book_title, author: author)
    end

end
