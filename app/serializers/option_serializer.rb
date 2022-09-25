class OptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :score, :option_image

  def option_image
    object.option_image.key.to_s if object.option_image.attached?
  end
end
