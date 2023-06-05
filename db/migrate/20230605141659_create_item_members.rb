class CreateItemMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :item_members do |t|
      t.references :item, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
