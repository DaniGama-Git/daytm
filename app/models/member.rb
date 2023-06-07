class Member < ApplicationRecord
  belongs_to :user
  has_many :item_members
  has_many :items, through: :item_members
end
