class ChangeDefaultSharedToAlbums < ActiveRecord::Migration[6.0]
  def change
    change_column_default :albums, :shared, true
  end
end
