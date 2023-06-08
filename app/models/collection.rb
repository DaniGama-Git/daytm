class Collection < ApplicationRecord
  belongs_to :user
  has_many :item_collections
  has_many :items, through: :item_collections

  include PgSearch::Model
  multisearchable against: [:label, :description]

  # include PgSearch::Model

  # pg_search_scope :global_search,
  #   against: [ :label, :description ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
