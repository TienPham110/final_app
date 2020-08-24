class ChangeTypeToFollows < ActiveRecord::Migration[6.0]
  def change
    change_column :follows, :follower_id, :bigint
    change_column :follows, :followed_user_id, :bigint
  end
end
