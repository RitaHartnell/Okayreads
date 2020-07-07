class Review < ApplicationRecord
    belongs_to :user
    belongs_to :book
    def username
        self.user.username
    end

    def booktitle
        self.book.title
    end
end
