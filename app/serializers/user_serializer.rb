class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :date_of_birth, :gender
end
