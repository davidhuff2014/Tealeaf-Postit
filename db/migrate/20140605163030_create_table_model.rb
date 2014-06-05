class CreateTableModel < ActiveRecord::Migration
  def change
    create_table :table_models do |t|
      t.string :name
    end
  end
end
