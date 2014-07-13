# encoding: UTF-8

# setting up relationship to tables note the class_name
class Post < ActiveRecord::Base
  # include Sluggable
  include SluggableDaveJul

  # include Voteable
  # has_many :votes, as: :voteable
  # now in gem
  include VoteableDaveJul

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 3 }

  sluggable_column :title

  # after_validation :generate_slug!

  # code from here relocated to lib/voteable.rb

  # def generate_slug!
  #   the_slug = to_slug(self.title)
  #   post = Post.find_by slug: the_slug
  #   count = 2
  #   while post && post != self
  #     the_slug = append_suffix(the_slug, count)
  #     post = Post.find_by slug: the_slug
  #     count += 1
  #   end
  #   self.slug = the_slug.downcase
  #   # self.slug = self.title.sub(" ","-").downcase # prefer the following
  #   # self.slug = self.title.parameterize # rails way without gem
  # end

  # def append_suffix(str, count)
  #   if str.split('-').last.to_i != 0
  #     return str.split('-').slice(0...-1).join('-') + '-' + count.to_s

  #   else
  #     return str + '-' + count.to_s
  #   end
  # end

  # def to_slug(name)
  #   str = name.strip
  #   str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
  #   str.gsub! /-+/, '-'
  #   str.downcase
  # end

  # def to_param
  #   self.slug
  # end
end
