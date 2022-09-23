class Board < ApplicationRecord
    has_many :votes
    has_many :comments
    has_many :options

    belongs_to :user
end
