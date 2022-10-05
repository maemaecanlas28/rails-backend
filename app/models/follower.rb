class Follower < ApplicationRecord
    belongs_to :user

    validates :user_id, uniqueness: { scope: [:follower_id] }
end
