class CreateUserSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_suggestions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :suggestion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
