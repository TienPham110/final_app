class AddDetailToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :likeType, :string
    add_column :likes, :like_id, :bigint
  end
end
