# encoding: UTF-8

# setting up relationship to tables note the class_name
class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 3 }
end
