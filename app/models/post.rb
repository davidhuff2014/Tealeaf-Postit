# encoding: UTF-8

# setting up relationship to tables note the class_name
class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  after_validation :generate_slug

  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 3 }

  # might want to relocate this, application controller?
  def total_votes
    self.up_votes - self.down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end

  def generate_slug
    self.slug = self.title.parameterize # rails way without gem
  end

  def to_param
    self.slug
  end
end
