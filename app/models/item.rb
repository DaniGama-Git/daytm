class Item < ApplicationRecord
  belongs_to :user
  has_many :item_collections
  has_many :collections, through: :item_collections
  has_many :item_tags
  has_many :tags, through: :item_tags
  has_many :item_members
  has_many :members, through: :item_members
  has_many :comments
  has_many_attached :photos
end
