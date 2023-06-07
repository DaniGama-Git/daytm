class Tag < ApplicationRecord
  belongs_to :user
  has_many :item_tags
  has_many :items, through: :item_tags
end
