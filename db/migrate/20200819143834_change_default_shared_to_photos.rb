class ChangeDefaultSharedToPhotos < ActiveRecord::Migration[6.0]
  def change
    change_column_default :photos, :shared, true
  end
  
end
