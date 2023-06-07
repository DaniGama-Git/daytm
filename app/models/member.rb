class Member < ApplicationRecord
  belongs_to :user
  has_many :item_members
  has_many :items, through: :item_members

  def full_name
    "#{first_name} #{last_name}"
  end
end
