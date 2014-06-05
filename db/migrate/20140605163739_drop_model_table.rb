class DropModelTable < ActiveRecord::Migration
  def change
    drop_table :table_models
  end
end
