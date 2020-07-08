class User < ApplicationRecord
    has_many :reviews
    has_many :books, through: :reviews
    has_many :favorites
    has_many :authors, through: :favorites

    validates :username, uniqueness: true
    validates :displayname, format: { with: /[\w\s]+/, message: "only allows letters and spaces" }
end
