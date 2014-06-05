# forms the association to both post and user
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end
