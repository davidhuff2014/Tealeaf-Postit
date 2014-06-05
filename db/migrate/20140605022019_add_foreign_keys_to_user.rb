# adding foreign keys to my user
class AddForeignKeysToUser < ActiveRecord::Migration
  def change
    add_column :users, :comments_id, :integer
    add_column :users, :posts_id, :integer
  end
end
