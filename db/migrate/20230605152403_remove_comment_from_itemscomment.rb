class RemoveCommentFromItemscomment < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :comment, :string
  end
end
