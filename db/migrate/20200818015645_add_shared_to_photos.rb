class AddSharedToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :shared, :boolean
  end
end
