class CreateItemCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :item_collections do |t|
      t.references :item, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
