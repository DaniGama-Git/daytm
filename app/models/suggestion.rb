class Suggestion < ApplicationRecord
  has_many :user_suggestions
  has_many :users, through: :user_suggestions, dependent: :destroy
end
