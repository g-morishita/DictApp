class Text < ApplicationRecord
  has_one_attached :sound
  belongs_to :item
end
