class User < ApplicationRecord
    has_many :followers
    has_many :boards
    has_many :comments
    has_many :votes

    has_secure_password
end
