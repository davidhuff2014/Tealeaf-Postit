# encoding: UTF-8

# setting up post_categories relationships
class PostCategory < ActiveRecord::Base
  belongs_to :post
  belongs_to :category
end
