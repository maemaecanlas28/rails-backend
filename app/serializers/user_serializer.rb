class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :name, :email, :date_of_birth, :gender, :avatar, :bio, :followers, :followings, :votes

  def avatar
    object.avatar.key.to_s if object.avatar.attached?
  end

  def followers
    followers = Follower.where(user_id: object.id)
  end
  
  def followings
    following = Follower.where(follower_id: object.id)
  end
end
