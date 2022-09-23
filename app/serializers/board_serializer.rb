class BoardSerializer < ActiveModel::Serializer
  attributes :id, :category, :description, :title, :end_date, :tags, :vote_count

  belongs_to :user
  has_many :comments
  has_many :options

  def vote_count
    object.votes.count
  end
end
