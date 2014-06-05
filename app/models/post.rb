# encoding: UTF-8

# setting up relationship to user
class Post < ActiveRecord::Base
  belongs_to :user
end
