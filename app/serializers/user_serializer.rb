class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :name, :email, :date_of_birth, :gender, :avatar, :bio, :followers, :followings, :votes

  def avatar
    object.avatar.key.to_s if object.avatar.attached?
  end

  def followers
    followers = Follower.where(user_id: object.id).map do |follower|
      user = User.find(follower.follower_id)
      user_info = { "user_id" => follower.follower_id, "username" => user.username}
      if user.avatar.attached? 
        user_info["avatar"] = user.avatar.key.to_s
      end
      user_info
    end
    return followers
  end
  
  def followings
    following = Follower.where(follower_id: object.id).map do |follower|
      user = User.find(follower.user_id)
      user_info = { "user_id" => follower.user_id, "username" => user.username}
      if user.avatar.attached? 
        user_info["avatar"] = user.avatar.key.to_s
      end
      user_info
    end
    return following
  end
end
