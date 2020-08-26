class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :likeable, polymorphic: true
    end
  end
end
