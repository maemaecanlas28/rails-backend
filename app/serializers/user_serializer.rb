class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :name, :email, :date_of_birth, :gender, :avatar

  # def avatar
  #   rails_blob_path(object.avatar, disposition: "attachment", only_path: true) if object.avatar.attached?
  # end

  def avatar
    object.avatar.key.to_s if object.avatar.attached?
  end
end
