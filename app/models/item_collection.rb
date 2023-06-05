class ItemCollection < ApplicationRecord
  belongs_to :item
  belongs_to :collection
end
