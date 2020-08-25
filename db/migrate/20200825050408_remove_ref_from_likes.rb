class RemoveRefFromLikes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :likes, :photo
    remove_reference :likes, :album
  end
end
