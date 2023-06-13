class Tag < ApplicationRecord
  belongs_to :user
  has_many :item_tags
  has_many :items, through: :item_tags

  include PgSearch::Model

  multisearchable against: [:name]
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true, dictionary: "english"} } }
end
