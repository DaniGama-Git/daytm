class Item < ApplicationRecord
  belongs_to :user
  has_many :item_collections
  has_many :collections, through: :item_collections
  has_many :item_tags
  has_many :tags, through: :item_tags
  has_many :comments
end
