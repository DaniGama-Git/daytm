class AddPhotoToCollections < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :photo_url, :string
  end
end
