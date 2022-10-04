class VoteSerializer < ActiveModel::Serializer
  attributes :id, :rankings, :user_id, :board_id

  # belongs_to :user
  # belongs_to :board
end