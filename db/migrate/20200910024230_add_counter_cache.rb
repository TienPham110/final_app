class AddCounterCache < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :photos_count, :integer, :default => 0
    add_column :users, :albums_count, :integer, :default => 0
  end
end
