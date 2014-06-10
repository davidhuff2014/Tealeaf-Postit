# encoding: UTF-8

# setting up relationships to both posts and comments
class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
end
