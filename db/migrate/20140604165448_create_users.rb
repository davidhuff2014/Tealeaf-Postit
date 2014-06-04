# encoding: UTF-8

# this class creates my table with columns
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username

      t.timestamps
    end
  end
end
