# encoding: UTF-8

# setting up relationship to posts
class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
end
