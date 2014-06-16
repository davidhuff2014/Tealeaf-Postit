# encoding: UTF-8

# setting up category
class Category < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  has_many :post_categories
  has_many :posts, through: :post_categories
end
