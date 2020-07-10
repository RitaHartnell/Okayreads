class Author < ApplicationRecord
    has_many :books
    has_many :favorites
    has_many :users, through: :favorites

end
