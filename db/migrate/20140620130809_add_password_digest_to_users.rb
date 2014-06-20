# encoding: UTF-8

# migration for adding password_digest to users table
class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
  end
end
