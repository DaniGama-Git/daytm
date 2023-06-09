class Item < ApplicationRecord
  belongs_to :user
  has_many :item_collections, dependent: :destroy
  has_many :collections, through: :item_collections, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags, dependent: :destroy
  has_many :item_members, dependent: :destroy
  has_many :members, through: :item_members, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  validates :title, length: { maximum: 40, too_long: "%{count} characters is the maximum allowed" }


  include PgSearch::Model

  multisearchable against: [:title, :description]
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true, dictionary: "english"} } }
end
