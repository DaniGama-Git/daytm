class Member < ApplicationRecord
  belongs_to :user
  has_many :item_members
  has_many :items, through: :item_members

  def full_name
    "#{first_name} #{last_name}"
  end

  include PgSearch::Model

  multisearchable against: [:first_name, :last_name]
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true, dictionary: "english"} } }
end
