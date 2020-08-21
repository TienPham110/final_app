class CreatJoinTableAlbumPhoto < ActiveRecord::Migration[6.0]
  def change
    create_join_table :albums, :photos, column_options: { null: false, foreign_key: true } do |t|
      t.index [:album_id, :photo_id]
      t.index [:photo_id, :album_id]
    end
  end
end
