# encoding: UTF-8

# setting up relationships to both posts and comments
class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  # has_secure_password # manually hanlding validations for project
  has_secure_password validations: false # to turn off validations

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 3 }

  after_validation :generate_slug

  def generate_slug
    self.slug = self.username.parameterize
  end

  def to_parm
    self.slug
  end
end
