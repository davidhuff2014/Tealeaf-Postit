# encoding: UTF-8

# setting up category relationships and validation
class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true, length: { minimum: 3 }

  after_validation :generate_slug

  def generate_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end
end
