class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :password_digest, :email, :date_of_birth, :gender
end
