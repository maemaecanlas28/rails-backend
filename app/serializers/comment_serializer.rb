class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :username, :avatar, :created_at


  belongs_to :user
  belongs_to :board

  def username
    object.user.username
  end

  def avatar
    object.user.avatar.key.to_s if object.user.avatar.attached?
  end
end
