class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :comment
      t.string :format
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
