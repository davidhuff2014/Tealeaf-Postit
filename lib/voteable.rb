# encoding: UTF-8
# Using Concerns

# module for counting votes
module Voteable
  extend ActiveSupport::Concern

  # executes this code when included only once
  included do
    has_many :votes, as: :voteable
  end

  # handles counting votes for comments and posts
  def total_votes
    up_votes - down_votes
  end

  def up_votes
    votes.where(vote: true).size
  end

  def down_votes
    votes.where(vote: false).size
  end

  # module ClassMethods
  #   def my_class_method

  #   end
  # end
end

# Using normal metaprogramming

# module Voteable
#   def self.included(base)
#     base.send(:include, InstanceMethods)
#     base.extend ClassMethods
#     base.class_eval do
#       my_class_method
#     end
#   end

#   # handles counting votes for comments and posts
#   module InstanceMethods
#     def total_votes
#       self.up_votes - self.down_votes
#     end

#     def up_votes
#       self.votes.where(vote: true).size
#     end

#     def down_votes
#       self.votes.where(vote: false).size
#     end
#   end

#   module ClassMethods
#     def my_class_method
#       # puts "This is a CLASS METHOD"
#       has_many :votes, as: :voteable

#     end
#   end
# end
