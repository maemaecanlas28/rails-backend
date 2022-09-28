class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :name, :email, :date_of_birth, :gender, :avatar

  def avatar
    object.avatar.key.to_s if object.avatar.attached?
  end
end
