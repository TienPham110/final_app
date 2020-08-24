class AddImageToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :photoFileName, :string
    add_column :photos, :photoFileSize, :bigint
    add_column :photos, :photoType, :string
  end
end
