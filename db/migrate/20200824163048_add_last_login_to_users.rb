class AddLastLoginToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :lastLogin, :datetime
  end
end
