class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :collections
  has_many :items
  has_many :members
  has_many :tags
  has_many :user_suggestions
  has_many :suggestions, through: :user_suggestions, dependent: :destroy


  include PgSearch::Model

  multisearchable against: [:first_name, :last_name]
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true, dictionary: "english"} } }
end
