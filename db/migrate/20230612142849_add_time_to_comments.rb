class AddTimeToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :time, :datetime
  end
end
