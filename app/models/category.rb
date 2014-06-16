# encoding: UTF-8

# setting up category relationships and validation
class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true, length: { minimum: 3 }
end
