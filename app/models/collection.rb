class Collection < ApplicationRecord
  belongs_to :user
  has_many :item_collections
  has_many :items, through: :item_collections

  include PgSearch::Model

  multisearchable against: [:label, :description]
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true, dictionary: "english"} } }
end
