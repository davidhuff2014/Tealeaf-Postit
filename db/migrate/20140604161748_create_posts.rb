# encoding: UTF-8

# this class creates my table with columns
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
