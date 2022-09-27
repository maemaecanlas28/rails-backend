class Option < ApplicationRecord
    belongs_to :board
    has_one_attached :option_image
end
