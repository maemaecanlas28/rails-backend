class VoteSerializer < ActiveModel::Serializer
  attributes :id, :rankings

  belongs_to :user
  belongs_to :board
end