# correct foreign key names
class ChangeForeignKeyNamesInTableUser < ActiveRecord::Migration
  def change
    rename_column :users, :comments_id, :comment_id
    rename_column :users, :posts_id, :post_id
  end
end
