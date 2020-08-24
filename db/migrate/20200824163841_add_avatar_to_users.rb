class AddAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatarFileName, :string
    add_column :users, :avatarFileSize, :bigint
    add_column :users, :avatarType, :string
  end
end
