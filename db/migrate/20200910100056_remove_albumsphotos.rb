class RemoveAlbumsphotos < ActiveRecord::Migration[6.0]
  def change
    drop_table :albums_photos
  end
end
