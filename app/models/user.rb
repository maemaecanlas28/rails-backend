class User < ApplicationRecord
    has_many :followers
    has_many :boards
    has_many :comments
    has_many :votes
    has_one_attached :avatar

    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :name, presence: true 
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
