class Item < ApplicationRecord
  has_one_attached :source
  has_many :texts

  validates :name, presence: true
end
