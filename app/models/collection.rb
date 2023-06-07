class Collection < ApplicationRecord
  belongs_to :user
  has_many :item_collections
  has_many :items, through: :item_collections
end
