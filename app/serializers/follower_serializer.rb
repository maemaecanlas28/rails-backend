class FollowerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :follower_id, :follower

  belongs_to :user

  def follower
    user = User.find(object.follower_id)
  end
end
