class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message


  belongs_to :user
  belongs_to :board
end
