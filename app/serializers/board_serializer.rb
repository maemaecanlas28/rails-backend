class BoardSerializer < ActiveModel::Serializer
  attributes :id, :category, :description, :title, :end_date, :tags
end
