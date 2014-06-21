class RemovePostIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :post_id, :integer
  end
end
