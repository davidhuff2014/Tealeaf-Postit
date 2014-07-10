# encoding: UTF-8

# module for counting votes
module Voteable
  extend ActiveSupport::Concern

  # executes this code when included only once
  include do
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
