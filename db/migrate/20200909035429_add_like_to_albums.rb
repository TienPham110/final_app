class AddLikeToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :like, :integer, default: 0
  end
end
