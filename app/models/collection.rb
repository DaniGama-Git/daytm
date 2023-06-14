class Collection < ApplicationRecord
  belongs_to :user
  has_many :item_collections
  has_many :items, through: :item_collections
  has_many_attached :photos, dependent: :destroy

  validates :label, length: { maximum: 40, too_long: "%{count} characters is the maximum allowed" }


  include PgSearch::Model

  multisearchable against: [:label, :description]
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true, dictionary: "english"} } }
end
