class User < ApplicationRecord
    has_many :reviews
    has_many :books, through: :reviews

    validates :username, uniqueness: true
    validates :displayname, format: { with: /[\w\s]+/, message: "only allows letters and spaces" }
end
