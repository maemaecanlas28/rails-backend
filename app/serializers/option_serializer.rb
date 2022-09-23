class OptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :score

  belongs_to :board
end
