class AddTimeToFollows < ActiveRecord::Migration[6.0]
  def change
    add_column :follows, :time, :datetime
  end
end
